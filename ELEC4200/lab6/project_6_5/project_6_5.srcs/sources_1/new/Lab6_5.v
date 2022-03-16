`timescale 1ns / 1ps

module Lab6_5(clk, ce, reset, count);
    input clk, ce, reset;
    output [7:0]count;
    wire [3:0] MSB,LSB;
    wire threshold1, threshold2;
    wire counter1_rst, counter2_rst;
    
    dec_binary_counter C1(.CLK(clk), .CE(ce), .SCLR(counter1_rst), .THRESH0(threshold1), .Q(LSB));
    dec_binary_counter C2(.CLK(clk), .CE(threshold1), .SCLR(counter2_rst), .THRESH0(threshold2), .Q(MSB));
    
    assign counter1_rst = reset | threshold1;
    assign counter2_rst = reset | threshold2;
    assign count = {MSB, LSB};
endmodule


module dff(D, clk, rst, Q);
    input D, clk, rst;
    output reg Q;
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst == 1)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule


module clk_divider(clk, reset, clk_out);
    input clk, reset;
    output clk_out;
    wire [8:0]din;
    wire [8:0]clk_div;
    
    dff dff_1(.clk(clk), .rst(reset), .D(din[0]), .Q(clk_div[0]));
    dff dff_2(.clk(clk_div[0]), .rst(reset), .D(din[1]), .Q(clk_div[1]));
    dff dff_3(.clk(clk_div[1]), .rst(reset), .D(din[2]), .Q(clk_div[2]));
    dff dff_4(.clk(clk_div[2]), .rst(reset), .D(din[3]), .Q(clk_div[3]));
    dff dff_5(.clk(clk_div[3]), .rst(reset), .D(din[4]), .Q(clk_div[4]));
    dff dff_6(.clk(clk_div[4]), .rst(reset), .D(din[5]), .Q(clk_div[5]));
    dff dff_7(.clk(clk_div[5]), .rst(reset), .D(din[6]), .Q(clk_div[6]));
    dff dff_8(.clk(clk_div[6]), .rst(reset), .D(din[7]), .Q(clk_div[7]));
    dff dff_9(.clk(clk_div[7]), .rst(reset), .D(din[8]), .Q(clk_div[8]));
    
    assign din = ~clk_div;
    assign clk_out = clk_div[8];
endmodule
