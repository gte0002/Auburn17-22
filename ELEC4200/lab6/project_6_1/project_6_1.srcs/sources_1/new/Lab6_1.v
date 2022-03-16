`timescale 1ns / 1ps

module Lab6_1(in, sel, out);
	input [3:0] in;
	input [1:0] sel;
	output reg out;
	always @ (in or sel)
		begin
		    if(sel == 2'b00) out = in[0];
		    else if(sel == 2'b01) out = in[1];
		    else if(sel == 2'b10) out = in[2];
		    else out = in[3];
	end
endmodule
