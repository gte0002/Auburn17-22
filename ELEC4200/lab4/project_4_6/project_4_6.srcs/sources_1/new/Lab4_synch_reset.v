`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:42:17 PM
// Design Name: 
// Module Name: Lab4_synch_reset
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


module Lab4_synch_reset(d,clk,clear,q);
    input d, clk, clear; 
    output reg q; 

    always@(posedge clk) 
    begin
        if(clear== 1)
        begin
            q <= 0;
        end
        else
        begin 
            q <= d; 
        end 
    end
endmodule
