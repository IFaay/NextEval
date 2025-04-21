import shutil
import zipfile
import requests
import time
import os

from sshtunnel import SSHTunnelForwarder

session = requests.Session()
session.trust_env = False

os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''

# ================== 配置区 ==================
INTERNAL_SERVER_IP = '172.16.64.217'
USE_PROXY_JUMP = True  # True = 使用跳板 jump2，False = 直连 eval
LOCAL_PORT = 18000
FLASK_PORT = 5000

# 跳板机配置
JUMP_HOST = {
    "ssh_address_or_host": ('124.221.109.43', 52368),
    "ssh_username": "zhongzhuan",
    "ssh_pkey": os.path.expanduser("~/.ssh/id_rsa"),
}


# ===========================================

def create_ssh_tunnel():
    if not USE_PROXY_JUMP:
        return None

    print("⛓ 正在通过跳板连接 jump2 → 目标服务器 eval ...")
    tunnel = SSHTunnelForwarder(
        ssh_address_or_host=JUMP_HOST['ssh_address_or_host'],
        ssh_username=JUMP_HOST['ssh_username'],
        ssh_private_key=JUMP_HOST['ssh_pkey'],
        remote_bind_address=(INTERNAL_SERVER_IP, FLASK_PORT),
        local_bind_address=('127.0.0.1', LOCAL_PORT),
    )

    tunnel.start()
    print(f"✅ SSH 隧道建立成功，本地端口：{tunnel.local_bind_port}")
    return tunnel

def run_client(file_path, task_type='generic'):
    tunnel = create_ssh_tunnel()

    # 构造基础地址
    if USE_PROXY_JUMP:
        base_url = f"http://127.0.0.1:{tunnel.local_bind_port}"
    else:
        base_url = f"http://{INTERNAL_SERVER_IP}:{FLASK_PORT}"

    try:
        # 上传文件
        # curl -X POST http://172.16.64.217:5000/upload -F "file=@your_file.dat" -F "task_type=nastran"
        url = f"{base_url}/upload"
        with open(file_path, 'rb') as f:
            res = session.post(url, files={'file': f}, data={'task_type': task_type})
            res.raise_for_status()
            task_id = res.json()['task_id']
            print("📤 上传成功，任务ID:", task_id)

        # 查询任务状态
        # curl http://172.16.64.217:5000/status/{task_id}
        status_url = f"{base_url}/status/{task_id}"
        while True:
            res = session.get(status_url)
            data = res.json()
            status = data['status']
            print("📡 当前状态:", status)
            if status == 'done':
                break
            elif status == 'failed':
                print("❌ 任务失败:", data.get('error'))
                return
            time.sleep(2)

        # 下载结果
        # curl -O http://172.16.64.217:5000/result/{task_id}
        result_url = f"{base_url}/result/{task_id}"
        zip_data = session.get(result_url).content
        output_file = f"{task_id}.zip"
        with open(output_file, 'wb') as f:
            f.write(zip_data)
        print(f"📦 下载完成，保存为：{output_file}")

        # 解压处理
        base_name = os.path.splitext(os.path.basename(file_path))[0]
        extract_dir = os.path.join(os.path.dirname(output_file), base_name)

        if os.path.exists(extract_dir):
            shutil.rmtree(extract_dir)
            print(f"⚠️ 已存在目录 '{extract_dir}'，已覆盖。")

        with zipfile.ZipFile(output_file, 'r') as zip_ref:
            zip_ref.extractall(extract_dir)

        print(f"📂 解压完成，结果已保存至目录: {extract_dir}")

    except Exception as e:
        print("🔥 错误:", e)
    finally:
        if tunnel:
            tunnel.stop()
            print("🔌 隧道关闭")

def test_connection():
    print("🧪 启动连接测试...")
    tunnel = create_ssh_tunnel()

    if USE_PROXY_JUMP:
        test_url = f"http://127.0.0.1:{tunnel.local_bind_port}/status/test"
    else:
        test_url = f"http://{INTERNAL_SERVER_IP}:{FLASK_PORT}/status/test"

    try:
        res = session.get(test_url)
        if res.status_code == 404:
            print("✅ Flask 服务响应正常（返回 404，说明在跑）")
        else:
            print(f"⚠️ Flask 返回状态码: {res.status_code}")
    except Exception as e:
        print("❌ 测试失败:", str(e))
    finally:
        if tunnel:
            tunnel.stop()
            print("🔌 隧道关闭")

if __name__ == '__main__':
    file_path = "/home/yfsun/Documents/NextEval/data/Abaqus/LE1_ Plane stress elements—elliptic membrane/nle1xf3c.inp"

    test_connection()
    if not os.path.exists(file_path):
        print("⚠️ 文件不存在")
    else:
        run_client(file_path, task_type='abaqus')