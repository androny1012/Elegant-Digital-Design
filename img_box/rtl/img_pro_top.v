module  img_pro_top(
    input                   clk         ,
    input                   rst_n       ,
    input                   vs_i        ,
    input                   hs_i        ,
    input                   de_i        ,
    input           [23:0]  data_i      ,
    output                  vs_o        ,
    output                  hs_o        ,
    output                  de_o        ,
    output          [23:0]  data_o
);


    img_rect  u_img_rect(
        .clk        (clk        ) ,
        .rst_n      (rst_n      ) ,
        .vs_i       (vs_i       ) ,
        .hs_i       (hs_i       ) ,
        .de_i       (de_i       ) ,
        .data_i     (data_i     ) ,
        .rect_color (24'hFF00FF ) ,
        .rect_x1    (11'd100    ) ,
        .rect_y1    (11'd100    ) ,
        .rect_x2    (11'd400    ) ,
        .rect_y2    (11'd400    ) ,
        .vs_o       (vs_o       ) ,
        .hs_o       (hs_o       ) ,
        .de_o       (de_o       ) ,
        .data_o     (data_o     )
    );

endmodule
