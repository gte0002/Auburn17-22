`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 3
// 
// Create Date: 09/06/2021 03:53:30 PM
// Design Name: 
// Module Name: Lab3_Comparator
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


module Lab3_Comparator(a,b,Lt,Gt,Eq);
    output Eq, Gt, Lt;
    input [1:0] a,b;
    reg [2:0] ROM [15:0];
    
    initial $readmemb ("Comparison.mem", ROM,0,15);
    assign {Lt,Gt,Eq} = ROM[{b,a}];
    
endmodule
