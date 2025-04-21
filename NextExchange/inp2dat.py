# -*- coding: utf-8 -*-
"""
Created on 2025/4/21

@author: Yifei Sun
"""

from pyNastran.converters.abaqus.abaqus import *


if __name__ == "__main__":
    model = Abaqus()
    model.read_abaqus_inp("./case1/nle1xf3c.inp")
