# -*- coding: utf-8 -*-
"""
Created on 4/13/25

@author: Yifei Sun

"""
import os
from PyPDF2 import PdfReader, PdfWriter

def split_pdf_by_pages(input_pdf_path, pages_per_split=600, output_folder="output_pdfs"):
    # 读取PDF
    reader = PdfReader(input_pdf_path)
    total_pages = len(reader.pages)

    # 创建输出文件夹
    os.makedirs(output_folder, exist_ok=True)

    # 拆分PDF
    for i in range(0, total_pages, pages_per_split):
        writer = PdfWriter()
        for j in range(i, min(i + pages_per_split, total_pages)):
            writer.add_page(reader.pages[j])

        output_filename = os.path.join(output_folder, f"split_{i//pages_per_split + 1}.pdf")
        with open(output_filename, "wb") as f_out:
            writer.write(f_out)
        print(f"Saved: {output_filename}")

    print("PDF 分割完成")

# 示例使用
split_pdf_by_pages("NastranQuickReference.pdf")
