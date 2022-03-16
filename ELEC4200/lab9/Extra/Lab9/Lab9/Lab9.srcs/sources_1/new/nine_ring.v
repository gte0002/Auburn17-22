`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 07:05:05 PM
// Design Name: 
// Module Name: nine_ring
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


module nine_ring(enable,out);
    input enable;
    output out;
    //output w1, w2, w3, w4, w5, w6, out;
    (* ALLOW_COMBINATIONAL_LOOPS = "TRUE" *)
    (* DONT_TOUCH = "TRUE" *) wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
    
    //input enable;
    //output w1, w2, w3, w4, w5, w6, Q;
    
    assign out = w10;
    and #5(w1, enable,out );   
    not #5(w2, w1);
    not #5(w3, w2);
    not #5(w4, w3);
    not #5(w5, w4);
    not #5(w6,w5);
    not #5(w7,w6);
    not #5(w8,w7);
    not #5(w9,w8);
    not #5(w10,w9);
    
    
    
    
    
    
endmodule
