0.指定一个文件夹作为workspace，终端要cd到此处

1.写好rtl，所有.v放到./rtl/ 目录下

2.写好仿真tb.所有.sv放到./sim/目录下
  注意.sv中要加入以下代码用于生成波形
  tb_xxs是本tb的模块名字

//***********************************************
initial
begin            
    $dumpfile("tb_xx.vcd"); //生成的vcd文件名称
    $dumpvars(0, tb_xx);    //tb模块名称
end
//***********************************************

3.修改./run.bat文件中的"set testbentch_module=tb_xx"
  tb_xxs是本tb的模块名字

4.命令行输入./run.bat //  .\run.sh
  (注意此时终端要在工作目录，即ls指令的时候会显示rtl、sim目录和.bat文件)

5.首次运行后会出现gtkwave，自行先产生波形观察后
  ctrl+s保存当前的波形为tb_xx.gtkw文件在sim目录

6.修改rtl或tb后，重新运行.bat/.sh，会自动读取gtkw的波形查看情况

至此完整的开发仿真流程完毕

可以自行修改.bat文件以让文件的分布符合你的习惯，注意相对路径的问题

compile和run可以分开，防止编译错误时没有提示