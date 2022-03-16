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
    wire in0; wire in1; wire in2; wire in3; wire in4; wire in5; wire in6; wire in7;

    
    assign in7 = T ^ out[7];
    assign in6 = out[7] ^ out[6];
    assign in5 = out[6] ^ out[5];
    assign in4 = out[5] ^ out[4];
    assign in3 = out[4] ^ out[3];
    assign in2 = out[3] ^ out[2];
    assign in1 = out[2] ^ out[1];
    assign in0 = out[1] ^ out[0];
    
    
    D_flipflop tff0(in7,Clk,reset,out[7]);
    D_flipflop tff1(in6,Clk,reset,out[6]);
    D_flipflop tff2(in5,Clk,reset,out[5]);
    D_flipflop tff3(in4,Clk,reset,out[4]);
    D_flipflop tff4(in3,Clk,reset,out[3]);
    D_flipflop tff5(in2,Clk,reset,out[2]);
    D_flipflop tff6(in1,Clk,reset,out[1]);
    D_flipflop tff7(in0,Clk,reset,out[0]);
    
    
    
endmodule

module D_flipflop(D, Clk,reset, Q);
    input D, Clk, reset;
    output reg Q;
   // output reg Q_out;
    always @ ( posedge Clk or posedge reset)
    if(reset)
    begin 
        Q <=1'b0;
        //Q_out <= 1'b1;
   end
    else
    begin
        Q<=D;
        //Q_out <= ~D;
    end        
            
endmodule



