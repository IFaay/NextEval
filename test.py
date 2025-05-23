# -*- coding: utf-8 -*-
"""
Created on 4/14/25

@author: Yifei Sun

"""
from openai import OpenAI
client = OpenAI(api_key="sk-cluhdroduuxirlhajacclovgxfrgbcufvjcrwdwqzfjzublc", base_url="https://api.siliconflow.cn/v1")

response = client.chat.completions.create(
    model="deepseek-ai/DeepSeek-V3",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Write a haiku about recursion in programming."}
    ],
    temperature=0.7,
    max_tokens=8192,
    stream=True
)
# 逐步接收并处理响应
for chunk in response:
    if not chunk.choices:
        continue
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end="", flush=True)
    if chunk.choices[0].delta.reasoning_content:
        print(chunk.choices[0].delta.reasoning_content, end="", flush=True)