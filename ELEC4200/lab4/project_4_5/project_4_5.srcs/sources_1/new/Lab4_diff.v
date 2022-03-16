`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:39:59 PM
// Design Name: 
// Module Name: Lab4_diff
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


module D_latch(input D, input Clk, output reg Qa);
	always @ (D or Clk)
	    if(Clk)
	    begin
		Qa <= D;
	    end
endmodule

//Rising Edge triggered D FF

module D_ff_rising(input D, input Clk, output reg Qb);
	always @ (posedge Clk)
	    if(Clk)
	    begin
		Qb <= D;
	    end
endmodule

//Falling Edge triggered D FF

module D_ff_falling(input D, input Clk, output reg Qc);
   always @ (negedge Clk)
	if(~Clk)
	begin
	   Qc <= D;
	end
endmodule

//Lab Circuit

module Lab5_5(input D, input Clk,output wire Qa, output wire Qb, output wire Qc);
    D_latch Dl(D,Clk,Qa);
    D_ff_rising Dffr(D,Clk,Qb);
    D_ff_falling Dfff(D,Clk,Qc);
endmodule
