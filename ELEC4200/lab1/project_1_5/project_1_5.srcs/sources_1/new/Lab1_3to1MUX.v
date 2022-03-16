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


module Lab1_3to1MUX(A, B, C, S1, S2, Y);
    output Y;
    input A, B, C, S1, S2;
    wire D, DBS, BS, AnotS, notS1, notS2, CnotS2;
    
    and (BS, B, S1), (AnotS, A, notS1);
    not (notS1, S1);
    or (D, BS, AnotS);
    
    and (DBS, D, S2), (CnotS2, C, notS2);
    not (notS2, S2);
    or (Y, DBS, CnotS2);
endmodule
