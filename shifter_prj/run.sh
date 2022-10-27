
cd sim
export testbentch_module=tb_easy_shifter
export testbentch_file="$testbentch_module.sv"
export rtl_file="../rtl/*.v"

iverilog -g2012 -o "$testbentch_module.vvp" $rtl_file $testbentch_file

vvp -n "$testbentch_module.vvp" -lxt2

export gtkw_file="$testbentch_module.gtkw"
if [ -f "$gtkw_file" ];then
gtkwave $gtkw_file
else
gtkwave "$testbentch_module.vcd"
fi