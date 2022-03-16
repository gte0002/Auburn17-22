`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 2
// 
// Create Date: 09/01/2021 05:34:14 PM
// Design Name: 
// Module Name: Lab2_CLA_adder
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


module Lab2_CLA_adder(a,b,cin,cout,s);
    input[3:0] a,b;
    input cin;
    output [3:0] s;
    output cout;
    wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3,c4;
    
    assign p0=(a[0]^b[0]),
    p1=(a[1]^b[1]),
    p2=(a[2]^b[2]),
    p3=(a[3]^b[3]);
    assign g0=(a[0]&b[0]),
    g1=(a[1]&b[1]),
    g2=(a[2]&b[2]),
    g3=(a[3]&b[3]);
    assign c0=cin,
    c1=g0|(p0&cin),
    c2=g1|(p1&g0)|(p1&p0&cin),
    c3=g2|(p2&g1)|(p2&p1&g0)|(p1&p1&p0&cin),
    c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
    assign s[0]=p0^c0,
    s[1]=p1^c1,
    s[2]=p2^c2,
    s[3]=p3^c3;
    assign cout=c4;
endmodule
