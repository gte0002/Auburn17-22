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


module Lab1_gateLevel_2wide(A, B, S, Y);
    output Y[1:0];
    input A[1:0], B[1:0], S;
    wire notA[1:0], notB[1:0], notS;
    
    and (notA[0], B[0], S), (notB[0], A[0], notS), (notA[1], B[1], S), (notB[1], A[1], notS);
    not (notS, S);
    or (Y[0], notA[0], notB[0]), (Y[1], notA[1], notB[1]);
endmodule
