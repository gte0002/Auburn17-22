`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:27:35 PM
// Design Name: 
// Module Name: Lab4_D_behavioral
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


module Lab4_D_behavioral(d,clk,q);
    input d, clk; 
    output reg q; 
    always @ (posedge clk)
        if(clk) begin
            q <= d;
        end
endmodule
