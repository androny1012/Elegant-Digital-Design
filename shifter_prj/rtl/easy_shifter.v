module easy_shifter(
        input           clk    ,
        input           rst    ,
        input           in     ,
        output  [2:0]   out     
    );

    reg [2:0]   in_reg;
    always@(posedge clk) begin
        if(rst)
            in_reg <= 3'd0;
        else
            in_reg <= {in_reg[1:0],in};
    end

    assign out = in_reg;

endmodule