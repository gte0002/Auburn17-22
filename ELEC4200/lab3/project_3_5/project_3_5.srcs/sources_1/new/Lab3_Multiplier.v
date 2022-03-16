`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 3
// 
// Create Date: 09/06/2021 03:54:54 PM
// Design Name: 
// Module Name: Lab3_Multiplier
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


module Lab3_Multiplier(a,b,y);
    input [1:0]a,b;
    output [3:0] y;
    
    reg [3:0] ROM [15:0];
        
    initial $readmemb ("Multiplication.mem", ROM,0,15);
    assign y = ROM[{b,a}];
endmodule
