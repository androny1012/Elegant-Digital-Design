module img_driver(
    input       clk,
    input       rst_n,
    output      vs_o,
    output      hs_o,
    output      de_o
);

    parameter   H_SYNC          = 10'd96    ,
                H_BACK_PORCH    = 10'd48    ,
                H_VALID         = 10'd640   ,
                H_FRONT_PORCH   = 10'd16    ,
                H_TOTAL         = 10'd800   ;
    
    parameter   V_SYNC          = 10'd2     ,
                V_BACK_PORCH    = 10'd33    ,
                V_VALID         = 10'd480   ,
                V_FRONT_PORCH   = 10'd10    ,
                V_TOTAL         = 10'd525   ;
    
    reg     [9:0]       h_cnt;
    reg     [9:0]       v_cnt;
    
    always  @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            h_cnt <= 'b0;
        else if (h_cnt == H_TOTAL-1)
            h_cnt <= 'b0;
        else
            h_cnt <= h_cnt + 1;
    end

    always  @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            v_cnt <= 'b0;
        else if (h_cnt == H_TOTAL-1)
        begin
            if (v_cnt == V_TOTAL - 1)
                v_cnt <= 'b0;
            else
                v_cnt <= v_cnt + 1;
        end
    end
            
    assign hs_o = (h_cnt <= H_SYNC - 1) ? 1'b1 : 1'b0;
    assign vs_o = (v_cnt <= V_SYNC - 1) ? 1'b1 : 1'b0;
    assign de_o =  ((h_cnt >= H_SYNC + H_BACK_PORCH) &&
                    (h_cnt <  H_SYNC + H_BACK_PORCH + H_VALID) &&
                    (v_cnt >= V_SYNC + V_BACK_PORCH) &&
                    (v_cnt <  V_SYNC + V_BACK_PORCH + V_VALID)) ? 1'b1 : 1'b0;
    
endmodule
