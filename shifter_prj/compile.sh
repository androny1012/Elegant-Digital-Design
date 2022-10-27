
cd sim
export testbentch_module=tb_easy_shifter
export testbentch_file="$testbentch_module.sv"
export rtl_file="../rtl/*.v"

iverilog -g2012 -o "$testbentch_module.vvp" $rtl_file $testbentch_file