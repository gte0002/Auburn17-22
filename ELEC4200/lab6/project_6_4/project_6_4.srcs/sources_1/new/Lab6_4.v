`timescale 1ns / 1ps

module Lab6_4(D, clk, rst, Q);
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
    
    
module clk_divider(clk, rst, clk_out);
    input clk, rst;
    output clk_out;
    wire [12:0]din;
    wire [12:0]clk_div;
    
    Lab6_4 dff_inst0(.clk(clk), .rst(rst), .D(din[0]), .Q(clk_div[0]));
    
    genvar i;
    generate
        for (i = 1; i < 13; i=i+1)
        begin : dff_gen_label
            Lab6_4 dff_inst ( .clk(clk_div[i-1]), .rst(rst), .D(din[i]), .Q(clk_div[i]));
        end
    endgenerate
    
    assign din = ~clk_div;
    assign clk_out = clk_div[12];
endmodule
    
    
module comparator_dataflow(in, out); //Output 1 when input is greater than 9
    input [3:0]in;
    output out;
    
    assign out = in[3] & (in[2] | in[1]);
endmodule
    
    
module circuitA_dataflow(a_in, a_out); //Circuit A determines m2:m0 when greater than 9
    input [2:0]a_in;
    output [2:0]a_out;
    
    assign a_out[0] = a_in[0];
    assign a_out[1] = ~a_in[1];
    assign a_out[2] = a_in[2] & a_in[1];
endmodule
    
    
module mux_2to1(x,y,s,m); //Dataflow 2to1 mux based on Lab1
    input x,y,s;
    output m;
    
    assign m = (~s & x) | (s & y);
endmodule
    
    
module bcd_7seg(x,seg);
    input [3:0]x;
    output [6:0]seg;
    
    assign seg[0] = (~x[3] & ~x[1] & (x[2] ^ x[0]));
    assign seg[1] = ~x[3] & x[2] & (x[1] ^ x[0]);
    assign seg[2] = ~x[3] & ~x[2] & x[1] & ~x[0];
    assign seg[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & x[1] &x[0]);
    assign seg[4]= x[0] | (~x[3] & x[2] & ~x[1]);
    assign seg[5] = (x[1] & x[0]) | (~x[3] & ~x[2] & (x[1] ^ x[0]));
    assign seg[6] = ~x[3] & ((~x[2] & ~x[1]) | (x[0] & (x[2] ~^ x[1])));
endmodule
    
    
module Lab2_2(clk, v, an_out, seg_out);
    input clk;
    input [3:0]v;
    output reg [7:0]an_out;
    output reg [6:0]seg_out;
    wire z;
    wire [3:0] m_out;
    wire [2:0] circuitA_in = v[2:0];
    wire [2:0] circuitA_out;
    wire [7:0]an0,an1;
    wire [6:0]seg0,seg1;
    
    comparator_dataflow C1(v, z);
    circuitA_dataflow circuitA(circuitA_in, circuitA_out);
    
    mux_2to1 M3(v[3], 1'b0, z, m_out[3]);
    mux_2to1 M2(v[2], circuitA_out[2], z, m_out[2]);
    mux_2to1 M1(v[1], circuitA_out[1], z, m_out[1]);
    mux_2to1 M0(v[0], circuitA_out[0], z, m_out[0]);
    
    bcd_7seg D1(m_out, seg0);
    bcd_7seg D2({3'b000,z}, seg1);
    
    assign an0 = 8'b11111110;
    assign an1 = 8'b11111101;
    
    always @(posedge clk)
    begin
        case(an_out)
            8'b11111110: begin an_out <= an1; seg_out <= seg1; end
            8'b11111101: begin an_out <= an0; seg_out <= seg0; end
            default: begin an_out <= an0; seg_out <= seg0; end
        endcase
    end
endmodule
    
    
module Lab9_2(clk, bin_in, anode, segment);
    input clk;
    input [3:0]bin_in;
    output [7:0]anode;
    output [6:0]segment;
    
    Lab2_2 bcd_display(.clk(clk), .v(bin_in), .an_out(anode), .seg_out(segment));
endmodule
