`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 1
// 
// Create Date: 08/25/2021 05:55:44 PM
// Design Name: 
// Module Name: Lab1
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


module Lab1_Behavioral(A, B, S, Y);
    input [1:0] A, B; 
    input S;
    output reg [1:0] Y;
    
    always @ (A or B or S)
    begin
        if (S)
        Y = B;    
        else
        Y = A;
    end
endmodule
