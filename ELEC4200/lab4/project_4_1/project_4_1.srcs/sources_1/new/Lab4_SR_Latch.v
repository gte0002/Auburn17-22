`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:11:28 PM
// Design Name: 
// Module Name: Lab4_SR_Latch
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


module Lab4_SR_Latch(s,r,q,qbar);
    input s,r;
    output q, qbar;

    assign #2 Q_i = q;
    assign #2 qbar_i = qbar;
    assign #2 q = ~ (r | qbar);
    assign #2 qbar = ~ (s | q);
endmodule