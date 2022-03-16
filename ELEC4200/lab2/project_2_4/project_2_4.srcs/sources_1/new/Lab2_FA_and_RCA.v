`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 2
//
// Create Date: 09/01/2021 04:50:36 PM
// Design Name: 
// Module Name: Lab2_FA_and_RCA
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


module Lab2_FA_and_RCA(a, b, cin, cout, s);
    // UNCOMMENT FOR THE 1 BIT ADDER
    /*input a, b, cin;
    output cout, s;
    
    assign s = (a ^ b) ^ cin;
    assign cout = (a & b) | (cin & b) | (a & cin);*/
    
    
    // UNCOMMENT FOR THE RIPPLE CURRENT ADDER 
    input [3:0] a,b; 
    input cin;
    output [3:0] s;
    output cout;
    wire w1,w2,w3;
    
    Lab2_FA_and_RCA f0(a[0],b[0],0,s[0],w1);
    Lab2_FA_and_RCA f1(a[1],b[1],w1,s[1],w2);
    Lab2_FA_and_RCA f2(a[2],b[2],w2,s[2],w3);
    Lab2_FA_and_RCA f3(a[3],b[3],w3,s[3],cout);

endmodule
