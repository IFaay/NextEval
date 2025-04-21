# -*- coding: utf-8 -*-
"""
Created on 2025/4/17

@author: Yifei Sun
"""

import requests
from bs4 import BeautifulSoup
from weasyprint import HTML
import os
from urllib.parse import urljoin, urlparse
from PyPDF2 import PdfMerger
import time
import re

title_map = {}

def sanitize_filename(name):
    return re.sub(r'[\\/:"*?<>|]+', '_', name).strip()

visited_urls = []
failed_urls = []
output_dir = "pdf_outputs"
os.makedirs(output_dir, exist_ok=True)

def process_url(url):
    if url in visited_urls or url in failed_urls:
        return
    visited_urls.append(url)

    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")
    title = soup.title.string.strip() if soup.title and soup.title.string else sanitize_filename(url)
    sanitized_title = sanitize_filename(title)
    title_map[url] = sanitized_title
    filename = f"{sanitized_title}.pdf"
    output_path = os.path.join(output_dir, filename)
    skip_pdf = os.path.exists(output_path)
    if skip_pdf:
        print(f"⏭️ Skipping PDF generation for already processed: {output_path}")

    try:
        for script in soup(["script", "style"]):
            script.decompose()

        content = soup.body
        anchor_id = sanitize_filename(url)
        content.insert(0, soup.new_tag("a", id=anchor_id))

        html_doc = f"""
        <html>
        <head>
            <meta charset="utf-8">
            <title>NAFEMS Benchmarks from Abaqus Docs</title>
        </head>
        <body>
            <h1>{soup.title.string if soup.title else url}</h1>
            {str(content)}
        </body>
        </html>
        """

        if not skip_pdf:
            try:
                HTML(string=html_doc, base_url=url).write_pdf(output_path)
                print(f"✅ PDF saved: {output_path}")
            except Exception as pdf_error:
                print(f"❌ PDF generation failed for {url}: {pdf_error}")
                failed_urls.append(url)
                return

        # 查找并处理页面中的链接
        for link_tag in soup.find_all("a", href=True):
            link = urljoin(url, link_tag["href"])
            if urlparse(link).netloc == urlparse(base_url).netloc and link.endswith(".htm"):
                link_tag["href"] = "#" + sanitize_filename(link)
                process_url(link)

    except Exception as e:
        print(f"❌ Failed to process {url}: {e}")
        failed_urls.append(url)

def retry_failed_urls(retry_delay=2, max_retries=2):
    for attempt in range(max_retries):
        if not failed_urls:
            break
        print(f"🔁 Retry attempt {attempt + 1} for failed URLs...")
        urls_to_retry = failed_urls[:]
        failed_urls.clear()
        for url in urls_to_retry:
            time.sleep(retry_delay)
            print(f"⏳ Retrying: {url}")
            process_url(url)

    if failed_urls:
        print(f"⚠️ Still failed after retries: {len(failed_urls)} URLs")
    else:
        print("✅ All failed URLs processed successfully on retry.")

def merge_pdfs(output_folder, merged_filename="merged_output.pdf"):
    merger = PdfMerger()

    # 美化封面内容
    cover_html = """
    <html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                padding-top: 100px;
            }
            h1 {
                font-size: 48px;
                margin-bottom: 20px;
            }
            p {
                font-size: 20px;
                color: #555;
            }
        </style>
    </head>
    <body>
        <h1>NAFEMS Benchmarks</h1>
        <p>Extracted from Abaqus 2023 Documentation</p>
        <p>Generated on-demand</p>
    </body>
    </html>
    """
    cover_path = os.path.join(output_folder, "cover.pdf")
    HTML(string=cover_html).write_pdf(cover_path)
    merger.append(cover_path)

    outline_stack = []
    for url in visited_urls:
        filename = title_map.get(url, sanitize_filename(url)) + ".pdf"
        filepath = os.path.join(output_folder, filename)
        if os.path.exists(filepath):
            try:
                page = requests.get(url)
                soup = BeautifulSoup(page.content, "html.parser")
                title = soup.title.text.strip() if soup.title else os.path.basename(url)
            except:
                title = os.path.basename(url)

            # Determine depth from URL path for nesting
            depth = urlparse(url).path.count('/')
            while len(outline_stack) > depth:
                outline_stack.pop()
            merger.append(filepath)

    merged_path = os.path.join(output_folder, merged_filename)
    merger.write(merged_path)
    merger.close()
    print(f"📚 Merged PDF with enhanced bookmarks saved: {merged_path}")
    print(f"🧾 Total documents merged (excluding cover): {len(visited_urls)}")

# base_url = "https://docs.software.vt.edu/abaqusv2023/English/SIMACAEBMKRefMap/simabmk-m-NAFEMSBenchmarks-sb.htm"
base_url = "https://docs.software.vt.edu/abaqusv2023/English/SIMACAEBMKRefMap/simabmk-m-StandardBenchmarksLinearElasticTests-sb.htm"
process_url(base_url)
retry_failed_urls()
merge_pdfs(output_dir)