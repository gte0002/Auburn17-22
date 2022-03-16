`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 3
// 
// Create Date: 09/06/2021 03:51:37 PM
// Design Name: 
// Module Name: Lab3_IC_Design
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


module Lab3_IC_Design(x,g1,g2a_n,g2b_n,y);
    input [2:0] x;
    input g1,g2a_n,g2b_n;
    output reg [7:0] y;
    
    always @(g1,g2a_n,g2b_n,x)
    case ({g1,g2a_n,g2b_n,x})   
        6'b100000 : y = 8'b11111110;
        6'b100001 : y = 8'b11111101;
        6'b100010 : y = 8'b11111011;
        6'b100011 : y = 8'b11110111;
        6'b100100 : y = 8'b11101111;
        6'b100101 : y = 8'b11011111;
        6'b100110 : y = 8'b10111111;
        6'b100111 : y = 8'b01111111;
        default : y = 8'b11111111;
    endcase
endmodule
