`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 2
//
// Create Date: 09/01/2021 04:36:21 PM
// Design Name: 
// Module Name: Lab2_2outof5-dataflow
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


module Lab2_2outof5_dataflow(a,b);
   input [3:0] a;
   output [4:0] b;
   
   assign b[0]=((~a[3]) & (~a[2]) & (~a[1])) | ((~a[3]) & (~a[2]) & a[0]) | (a[2] & (a[1] & (~a[0])));
   assign b[1]=((~a[3]) & (~a[2]) & (~a[1]) & (~a[0])) | ((~a[3]) & (a[2]) & (~a[1]) & (~a[0])) | ((~a[3]) & (~a[2]) & a[1] & (~a[0])) | (a[2] & a[1] & a[0]);
   assign b[2]=((~a[3]) & (~a[1]) & a[0]) | ((~a[2]) & a[1] & (~a[0])) | (a[3] & (~a[0]));
   assign b[3]=((~a[2]) & a[1] & a[0]) | (a[2] & (~a[1])) | (a[3] & a[0]);
   assign b[4]=(a[2] & a[1] & (~a[0])) | (a[3]);
endmodule
