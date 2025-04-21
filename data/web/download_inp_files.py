# -*- coding: utf-8 -*-
"""
Created on 2025/4/21

@author: Yifei Sun
"""
"""
Created on 2025/4/21
Script to download all .inp files from a given URL and store them in ../Abaqus/<PageTitle>/ directory.
"""
import time

import os
import re
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse

def fetch_with_retry(url, retries=3, delay=2):
    for attempt in range(retries):
        try:
            response = requests.get(url)
            response.raise_for_status()
            return response
        except Exception as e:
            print(f"⚠️ Attempt {attempt+1} failed for {url}: {e}")
            time.sleep(delay)
    raise Exception(f"❌ All {retries} attempts failed for {url}")

def sanitize_filename(name):
    """
    清理非法文件名字符，确保跨平台兼容
    """
    return re.sub(r'[\\/:"*?<>|]+', '_', name).strip()

def download_inp_files(base_url, visited=None):
    if visited is None:
        visited = set()
    if base_url in visited:
        return
    visited.add(base_url)

    try:
        response = fetch_with_retry(base_url)
    except Exception as e:
        print(f"❌ Failed to fetch URL: {base_url}\n   Error: {e}")
        return

    soup = BeautifulSoup(response.content, 'html.parser')

    # 页面标题作为文件夹名
    title = soup.title.string.strip() if soup.title else 'AbaqusFiles'
    folder_name = sanitize_filename(title)

    # 查找所有 .inp 链接
    links = soup.find_all('a', href=True)
    # Crawl .htm links regardless of .inp files found
    for link in links:
        href = link['href']
        full_url = urljoin(base_url, href)
        if href.lower().endswith('.htm') and urlparse(full_url).netloc == urlparse(base_url).netloc:
            download_inp_files(full_url, visited)
    inp_links = [urljoin(base_url, link['href']) for link in links if link['href'].lower().endswith('.inp')]

    if not inp_links:
        print("⚠️ No .inp files found on this page.")
        return

    target_dir = os.path.abspath(os.path.join('..', 'Abaqus', folder_name))
    os.makedirs(target_dir, exist_ok=True)
    print(f"📁 Saving files to: {target_dir}")

    for link in inp_links:
        try:
            file_name = os.path.basename(urlparse(link).path)
            file_path = os.path.join(target_dir, sanitize_filename(file_name))
            print(f"⬇️ Downloading: {link}")
            file_resp = fetch_with_retry(link)
            with open(file_path, 'wb') as f:
                f.write(file_resp.content)
            print(f"✅ Saved: {file_path}")
        except Exception as e:
            print(f"❌ Failed to download {link}: {e}")

    # The .htm link crawling has been moved earlier, so this block is removed.

if __name__ == '__main__':
    # url = "https://docs.software.vt.edu/abaqusv2023/English/SIMACAEBMKRefMap/simabmk-c-le1.htm"
    url = "https://docs.software.vt.edu/abaqusv2023/English/SIMACAEBMKRefMap/simabmk-m-StandardBenchmarksLinearElasticTests-sb.htm"
    download_inp_files(url)