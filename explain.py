# -*- coding: utf-8 -*-
"""
Created on 4/13/25

@author: Yifei Sun
"""

import os
import time
import threading
import concurrent.futures
from openai import OpenAI

# 初始化 OpenAI 客户端
client = OpenAI(
    api_key="sk-cluhdroduuxirlhajacclovgxfrgbcufvjcrwdwqzfjzublc",
    base_url="https://api.siliconflow.cn/v1"
)

# =============================
# ⚙️ Token 限速控制工具
# =============================

class TokenBucket:
    def __init__(self, max_tokens_per_minute):
        self.capacity = max_tokens_per_minute
        self.tokens = max_tokens_per_minute
        self.lock = threading.Lock()
        self.last_refill = time.time()

    def _refill(self):
        now = time.time()
        elapsed = now - self.last_refill
        if elapsed >= 60:
            self.tokens = self.capacity
            self.last_refill = now

    def consume(self, estimated_tokens):
        while True:
            with self.lock:
                self._refill()
                if self.tokens >= estimated_tokens:
                    self.tokens -= estimated_tokens
                    return
            time.sleep(0.5)

# 初始化 Token 限速器（10,000 TPM）
token_bucket = TokenBucket(max_tokens_per_minute=10000)

# =============================
# 📏 Token 估算函数
# =============================

def estimate_total_tokens(text):
    return max(100, int(len(text) / 3.5)) + 1500  # 用于整段

def estimate_line_tokens(text):
    return max(1, int(len(text) / 4))  # 用于按行估算，更保守

# =============================
# 🔧 拆分内容函数（改进版）
# =============================

def split_large_content(content, max_chunk_tokens=6000):
    lines = content.splitlines()
    chunks = []
    current_chunk = []
    current_token_count = 0

    for line in lines:
        line_token_est = estimate_line_tokens(line)
        if current_token_count + line_token_est > max_chunk_tokens:
            if current_chunk:
                chunks.append("\n".join(current_chunk))
            current_chunk = [line]
            current_token_count = line_token_est
        else:
            current_chunk.append(line)
            current_token_count += line_token_est

    if current_chunk:
        chunks.append("\n".join(current_chunk))

    return chunks

# =============================
# 💬 单段解释函数
# =============================

def explain_dat_chunk(chunk, part_idx=None):
    prompt = f"""
你是一个结构有限元专家，擅长解释 MSC Nastran 的输入文件格式（.dat）。请详细解释以下模型输入部分的含义，包括节点（GRID）、单元（如CQUAD4）、材料属性（MAT1）等内容，要求用中文简洁清晰地说明其建模目的和关键参数。

以下是输入文件内容：
{chunk}
"""

    estimated_token_usage = estimate_total_tokens(prompt)
    print(f"📏 本段预估 token 数量: {estimated_token_usage}")
    token_bucket.consume(estimated_token_usage)

    response = client.chat.completions.create(
        model="Pro/deepseek-ai/DeepSeek-V3",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt}
        ],
        temperature=0.3,
        max_tokens=8192,
        stream=True
    )

    explanation = ""
    for chunk in response:
        if not chunk.choices:
            continue
        delta = chunk.choices[0].delta
        if hasattr(delta, "content") and delta.content:
            explanation += delta.content
            # print(delta.content, end="", flush=True)
        elif hasattr(delta, "reasoning_content") and delta.reasoning_content:
            explanation += delta.reasoning_content
            # print(delta.reasoning_content, end="", flush=True)

    if part_idx is not None:
        return f"【第 {part_idx + 1} 段说明】\n{explanation.strip()}"
    return explanation.strip()

# =============================
# 🔍 主功能模块
# =============================

def explain_dat_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    estimated_token_usage = estimate_total_tokens(content)
    print(f"📏 预估 token 数量: {estimated_token_usage}")

    if estimated_token_usage > 7000:
        print(f"⚠️ 内容超过 7000 tokens，进行适度分段处理：{filepath}")
        chunks = split_large_content(content)
        full_explanation = ""
        for idx, chunk in enumerate(chunks):
            print(f"\n🔹 正在处理第 {idx + 1}/{len(chunks)} 段")
            full_explanation += explain_dat_chunk(chunk, idx) + "\n"
        return full_explanation.strip()
    else:
        return explain_dat_chunk(content)

def load_processed_files(output_md):
    if not os.path.exists(output_md):
        return set()
    processed = set()
    with open(output_md, 'r', encoding='utf-8') as f:
        for line in f:
            if line.startswith("| `") and "`" in line:
                filename = line.split("`")[1]
                processed.add(filename)
    return processed

write_lock = threading.Lock()

def process_single_file(folder_path, filename):
    filepath = os.path.join(folder_path, filename)
    print(f"\n🚀 正在处理：{filename}")
    try:
        explanation = explain_dat_file(filepath)
    except Exception as e:
        print(f"❌ 处理 {filename} 时出错: {e}")
        explanation = f"出错：{str(e)}"

    safe_expl = explanation.replace("\n", "<br>").replace("|", "\\|")
    return f"| `{filename}` | {safe_expl} |\n"

def batch_process_and_save_md_parallel(folder_path, output_md="nastran_explanations.md", max_workers=4):
    processed_files = load_processed_files(output_md)
    print(f"🔄 已处理文件数量: {len(processed_files)}")

    all_dat_files = [f for f in os.listdir(folder_path) if f.endswith(".dat")]
    remaining_files = [f for f in all_dat_files if f not in processed_files]
    print(f"📝 本次待处理文件数量: {len(remaining_files)}")

    first_write = not os.path.exists(output_md) or os.stat(output_md).st_size == 0
    if first_write:
        with open(output_md, 'w', encoding='utf-8') as f:
            f.write("| 文件名 | 模型解释 |\n")
            f.write("|--------|-----------|\n")

    with concurrent.futures.ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {
            executor.submit(process_single_file, folder_path, filename): filename
            for filename in remaining_files
        }

        with open(output_md, 'a', encoding='utf-8') as f:
            for future in concurrent.futures.as_completed(futures):
                filename = futures[future]
                try:
                    result_line = future.result()
                    with write_lock:
                        f.write(result_line)
                        f.flush()
                except Exception as exc:
                    print(f"⚠️ 文件 {filename} 写入失败: {exc}")

    print(f"\n✅ 所有剩余文件已处理并保存到：{output_md}")

# =============================
# 🧪 主程序入口
# =============================

if __name__ == "__main__":
    batch_process_and_save_md_parallel("./data/Nastran/demo", max_workers=3)
