`timescale 1ns / 1ps

module Lab6_1Test();
    reg [3:0] in;
	reg [1:0]sel;
	wire out;
	Lab6_1 UUT(.in(in), .sel(sel), .out(out));
	initial
	   begin
		in = 0;
		#5 sel = 2'b00;
		#5 in = 1;
		#5 sel = 2'b01;
		#5 in = 7;
		#5 sel = 2'b10;
		#5 in = 0;
		#5 sel = 2'b11;
		#5 in = 15;
		#10 $finish;
	end
endmodule
