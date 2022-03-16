`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 10:41:14 PM
// Design Name: 
// Module Name: task6
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

module task6(Clk, T, clearN, out);
    input T, Clk, clearN;
   // output [7:0] Q;
    output [7:0]  out;
    
    assign t1_in = T & out[7];
    assign t2_in = t1_in & out[6];
    assign t3_in = t2_in & out[5];
    assign t4_in = t3_in & out[4];
    assign t5_in = t4_in & out[3];
    assign t6_in = t5_in & out[2];
    assign t7_in = t6_in & out[1];
    
    T_flipflop t0(T, Clk, clearN,     out[7]);
    T_flipflop t1(t1_in, Clk, clearN, out[6]);
    T_flipflop t2(t2_in, Clk, clearN, out[5]);
    T_flipflop t3(t3_in, Clk, clearN, out[4]);
    T_flipflop t4(t4_in, Clk, clearN, out[3]);
    T_flipflop t5(t5_in, Clk, clearN, out[2]);
    T_flipflop t6(t6_in, Clk, clearN, out[1]);
    T_flipflop t7(t7_in, Clk, clearN, out[0]);
    
    

endmodule
module T_flipflop(T, Clk, clearN, Q);
    input T, Clk, clearN;
    output reg   Q;
    //output Q_out;
    //assign Q_out = Q;

    always@(posedge Clk or negedge clearN)
    begin
        if(~clearN)
            Q <= 1'b0;
        else
            Q <= Q ^ T;       
    end      
           

endmodule
