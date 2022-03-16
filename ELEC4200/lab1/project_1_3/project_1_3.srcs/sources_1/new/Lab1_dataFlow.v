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


module Lab1_dataFlow(x, y, s, m);
    output [1:0] m;
    input [1:0] x, y; 
    input s;
    wire notA[1:0], notB[1:0], notS;
    
    // The '?' means output Y will equal B if line S is true, or equal A if line S is false
    assign #3 m[0] = (s) ? y[0]: x[0];
    assign #3 m[1] = (s) ? y[1]: x[1];

endmodule
