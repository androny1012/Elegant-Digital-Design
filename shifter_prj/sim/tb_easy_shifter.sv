`timescale 1ns / 1ns

module tb_easy_shifter();

easy_shifter u(.*);

logic       clk   ;
logic       rst   ;
logic       in    ;
logic [2:0] out   ;

integer i   ;

initial
begin            
    $dumpfile("tb_easy_shifter.vcd"); //生成的vcd文件名称
    $dumpvars(0, tb_easy_shifter);    //tb模块名称
end


always begin
    #1 clk = ~clk;  
end

initial begin
    clk = 1'b1;
    rst = 1'b1;

    #10;
    @(negedge clk); rst = 1'b0;
end


initial begin
    $display("***********tb_easy_shifter test*****************");
    i = 0;
    in = 0;
    #1;
    for(i = 0; i< 40 ; i = i + 1) begin
        in = $random(); 
        #2;
    end

    #30
    if(out == 3'b111)
        $display("*****************PASSED*************************");
    else
        $display("******************ERROR*************************");
    $finish;
end

endmodule
