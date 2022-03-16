`timescale 1ns / 1ps

// Define T_FF
module T_ff (input Clk, input reset, input T, output reg Q);
    always @(posedge Clk or negedge reset)
     begin
         if(~reset)
            Q <= 1'b0;
        else
            Q <= Q ^ T;
    end
endmodule
//Define 8 bit Counter

module counter_8bit(input Clk, input Clear_n, input Enable, output [7:0] Q);
    wire w0, w1, w2, w3, w4, w5, w6, w7;
    //ff1
    T_ff ff0(.Clk(Clk),.reset(Clear_n),.T(Enable),.Q(Q[0]));
    and (w0, Q[0], Enable);
    //ff2
    T_ff ff1(.Clk(Clk),.reset(Clear_n),.T(w0),.Q(Q[1]));
    and (w1,Q[1],w0);
    //ff3
    T_ff ff2(.Clk(Clk),.reset(Clear_n),.T(w1),.Q(Q[2]));
    and (w2,Q[2],w1);
    //ff4
    T_ff ff3(.Clk(Clk),.reset(Clear_n),.T(w2),.Q(Q[3]));
    and (w3,Q[3],w2);
    //ff5
    T_ff ff4(.Clk(Clk),.reset(Clear_n),.T(w3),.Q(Q[4]));
    and (w4,Q[4],w3);
    //ff6
    T_ff ff5(.Clk(Clk),.reset(Clear_n),.T(w4),.Q(Q[5]));
    and (w5,Q[5],w4);
    //ff7
    T_ff ff6(.Clk(Clk),.reset(Clear_n),.T(w5),.Q(Q[6]));
    and (w6,Q[6],w5);
    //ff8
    T_ff ff7(.Clk(Clk),.reset(Clear_n),.T(w6),.Q(Q[7]));
endmodule