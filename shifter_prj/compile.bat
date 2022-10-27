@echo off
cd sim
set testbentch_module=tb_easy_shifter
set testbentch_file="%testbentch_module%.sv"
set rtl_file="../rtl/*.v"

iverilog -g2012 -o "%testbentch_module%.vvp" %rtl_file% %testbentch_file%