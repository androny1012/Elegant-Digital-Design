`timescale 1ns / 1ns

module tb_imgpro();

    img_pro_top u(.*);

    logic clk   ;
    logic rst_n ;
    logic vs_i;
    logic hs_i;
    logic de_i;  
    logic vs_o;
    logic hs_o;
    logic de_o;    
    logic [23:0]  data_i;
    logic [23:0]  data_o;

    integer i;
    img_driver u_img_driver(
        .clk  (clk     )    ,
        .rst_n(rst_n   )    ,
        .vs_o (vs_i    )    ,
        .hs_o (hs_i    )    ,
        .de_o (de_i    )
    );

    logic  [23:0] mem [0:307199];
    logic  [31:0] addr ;
    initial
    begin
        $readmemh("../py/th.txt",mem);
        addr  = 32'd0;
        data_i = mem[addr];
    end
    always@(negedge clk) begin
        if(de_i) begin
            data_i = mem[addr];
            addr = addr + 10'd1;
        end
    end

    integer handle;
    initial begin
        handle  =  $fopen("../py/th_out.txt");
    end
    always@(posedge clk)begin
        if(de_o) begin
            $fdisplay(handle,"%H",data_o);
        end
        if(de_o && u.u_img_rect.row_cnt == 480 && u.u_img_rect.col_cnt == 640) begin
            $fclose(handle);
        end
    end


    initial
    begin            
        $dumpfile("tb_imgpro.vcd");        //生成的vcd文件名称
        $dumpvars(0, tb_imgpro);    //tb模块名称
    end


    always begin
        #1 clk = ~clk;  
    end


initial begin
    i = 0;

    clk = 1'b1;
    rst_n = 1'b0;

    #10;
    @(negedge clk); rst_n = 1'b1;

    #1;
    @(de_o && u.u_img_rect.row_cnt == 480 && u.u_img_rect.col_cnt == 640);
    #1000;

    // for(i = 0; i< 8 ; i = i + 1) begin
    //     rst_n = i;
    // end

    $finish;
end

endmodule
