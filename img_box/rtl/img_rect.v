module  img_rect(
    input                   clk         ,
    input                   rst_n       ,
    input                   vs_i        ,
    input                   hs_i        ,
    input                   de_i        ,
    input           [23:0]  data_i      ,
    input           [23:0]  rect_color  ,
    input           [10:0]  rect_x1     ,
    input           [10:0]  rect_y1     ,
    input           [10:0]  rect_x2     ,
    input           [10:0]  rect_y2     ,
    output                  vs_o        ,
    output                  hs_o        ,
    output                  de_o        ,
    output          [23:0]  data_o
);
    // parameter   IMG_W           = 1280;
    parameter   IMG_W           = 640;
    reg     [10:0]  row_cnt     ;
    reg     [10:0]  col_cnt     ;
    reg     [23:0]  data_o_reg  ;
    wire    [10:0]  rect_width  ;
    assign rect_width = 11'd5;

    reg     vs_reg;
    reg     hs_reg;
    reg     de_reg;

    always  @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            col_cnt <= 'd0;
        else if(hs_i == 1'b1)
            col_cnt <= 'd0;
        else if(de_i == 1'b1)
            col_cnt <= col_cnt + 1'b1;
    end

    always  @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            row_cnt <= 'd0;
        else if(vs_i == 1'b1)
            row_cnt <= 'd0;
        else if(col_cnt == (IMG_W - 1) && de_i == 1'b1)
            row_cnt <= row_cnt + 1'b1;
    end

    always  @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            data_o_reg <= 12'h0;
        else if(col_cnt >= rect_x1 && col_cnt < rect_x1 + rect_width && row_cnt >= rect_y1 && row_cnt <= rect_y2)
            data_o_reg <= rect_color;
        else if(col_cnt >= rect_x2 && col_cnt < rect_x2 + rect_width && row_cnt >= rect_y1 && row_cnt < rect_y2 + rect_width)
            data_o_reg <= rect_color;
        else if(row_cnt >= rect_y1 && row_cnt < rect_y1 + rect_width && col_cnt >= rect_x1 && col_cnt <= rect_x2)
            data_o_reg <= rect_color;
        else if(row_cnt >= rect_y2 && row_cnt < rect_y2 + rect_width && col_cnt >= rect_x1 && col_cnt <= rect_x2)
            data_o_reg <= rect_color;
        else
            data_o_reg <= data_i;
    end

    always  @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            vs_reg <= 1'b0;
            hs_reg <= 1'b0;
            de_reg <= 1'b0;        
        end else begin
            vs_reg <= vs_i;
            hs_reg <= hs_i;
            de_reg <= de_i; 
        end
    end

    assign vs_o = vs_reg;
    assign hs_o = hs_reg;
    assign de_o = de_reg;
    assign data_o = data_o_reg;

endmodule
