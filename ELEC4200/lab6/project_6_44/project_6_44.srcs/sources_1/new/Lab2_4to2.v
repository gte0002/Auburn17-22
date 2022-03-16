`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 2
//
// Create Date: 09/01/2021 04:00:33 PM
// Design Name: 
// Module Name: Lab2_4to2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab2_4to2(v,z,m,seg,set0,clk);
    input [3:0]v;
    output reg [3:0] m;
    output reg z;
    output reg [6:0] seg;
    output [7:0] set0;
    input clk;
    wire clk_out;
    assign set0 = 8'b11111100;
    
    clk_wiz_0 UUT1 ( .clk_in1(clk), .clk_out1(clk5), .locked(locked));
    divider DUT1 (.clock_in(clk5), .clock_out(clk_out));
    
    always @(v)
    begin
        if(v < 4'b1010)
            {z,m} = {1'b0,v};
        else
        begin
            z=1'b1;
            m=v-4'b1010;
        end
        case (m) //case statement
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0000100;
            //switch off 7 segment character if bcd digit != decimal number.
            default : seg = 7'b1111111; 
        endcase
    end
endmodule
