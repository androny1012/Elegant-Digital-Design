@echo off
D:/software/miniconda3/envs/torch/python.exe e:/work/hw/img_process/work/img_box/py/img2txt.py

cd sim
set testbentch_module=tb_imgpro
set testbentch_file="%testbentch_module%.sv"
set rtl_file="../rtl/*.v"

iverilog -g2012 -o "%testbentch_module%.vvp" %rtl_file% %testbentch_file%
vvp -n "%testbentch_module%.vvp" -lxt2

cd ..
D:/software/miniconda3/envs/torch/python.exe e:/work/hw/img_process/work/img_box/py/txt2img.py
