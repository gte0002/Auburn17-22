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


module Lab1_gateLevel(A, B, S, Y);
    output Y;
    input A, B, S;
    wire BS, AnotS, notS;
    
    and (BS, B, S), (AnotS, A, notS);
    not (notS, S);
    or (Y, BS, AnotS);
   
endmodule
