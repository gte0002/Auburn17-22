`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 09:41:46 AM
// Design Name: 
// Module Name: task7
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
module task7(Clk, T, Q);
    input T, Clk;
    output  Q;
    
    

    
    T_flipflop t7(T, Clk,Q);

    

endmodule
*/
module task7(T, Clk, reset, out);
    input T, Clk, reset;
    output [7:0] out;
    //output Q_out;
    /*
    wire in0; wire in1; wire in2; wire in3; wire in4; wire in5; wire in6; wire in7;
    wire in00; wire in11; wire in22; wire in33; wire in44; wire in55; wire in66; 
    */
    assign t1_in = T & out[7];
    assign t2_in = t1_in & out[6];
    assign t3_in = t2_in & out[5];
    assign t4_in = t3_in & out[4];
    assign t5_in = t4_in & out[3];
    assign t6_in = t5_in & out[2];
    assign t7_in = t6_in & out[1];
    
    D_flipflop t0(T, Clk, reset,     out[7]);
    D_flipflop t1(t1_in, Clk, reset, out[6]);
    D_flipflop t2(t2_in, Clk, reset, out[5]);
    D_flipflop t3(t3_in, Clk, reset, out[4]);
    D_flipflop t4(t4_in, Clk, reset, out[3]);
    D_flipflop t5(t5_in, Clk, reset, out[2]);
    D_flipflop t6(t6_in, Clk, reset, out[1]);
    D_flipflop t7(t7_in, Clk, reset, out[0]);

    
    
endmodule

module D_flipflop(D, Clk,reset, Q);
    input D, Clk, reset;
    output reg Q;
    wire T;
   // output reg Q_out;
    assign T = D ^ Q;
    always @ ( posedge Clk or posedge reset)
    if(reset)
    begin 
        Q <=8'b00000000;
        //Q_out <= 1'b1;
    end
    else
    begin
        Q<=T;
        //Q_out <= ~D;
    end        
            
endmodule



