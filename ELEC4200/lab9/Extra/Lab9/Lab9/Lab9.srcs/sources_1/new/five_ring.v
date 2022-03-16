`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 12:22:56 PM
// Design Name: 
// Module Name: five_ring
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
/*
(* DONT_TOUCH = "TRUE" *)
(* ALLOW_COMBINATIONAL_LOOPS = "TRUE" *)

*/

module five_ring(enable,out);
    input enable;
    output out;
    //output w1, w2, w3, w4, w5, w6, out;
    (* ALLOW_COMBINATIONAL_LOOPS = "TRUE" *)
    (* DONT_TOUCH = "TRUE" *) wire w1, w2, w3, w4, w5, w6;
    
    //input enable;
    //output w1, w2, w3, w4, w5, w6, Q;
    
    assign out = w6;
    and #5(w1, enable,out );   
    not #5(w2, w1);
    not #5(w3, w2);
    not #5(w4, w3);
    not #5(w5, w4);
    not #5(w6,w5);
    
    
    
    
    
    
endmodule
