`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:56:15 PM
// Design Name: 
// Module Name: Lab4_TSynch_clock
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


module Lab4_TSynch_clock(Clk,reset_n,T,Q);
    input Clk,reset_n,T;
    output reg Q;
    
    always @(negedge Clk)
    begin
        if (!reset_n) 
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end
endmodule
