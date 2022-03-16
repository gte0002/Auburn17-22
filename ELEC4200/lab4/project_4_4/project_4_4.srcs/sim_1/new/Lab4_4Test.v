`timescale 1ns / 1ps
// Testbench for task 4 of Lab 4
module Lab4_4Test();
    reg D,Clk;
	wire Q;
	
	Lab4_D_behavioral UUT(.d(D),.clk(Clk),.q(Q));

	initial
	    begin
		D=0;
		Clk=0;
	    forever#10
		Clk=~Clk;
	    end
	initial
	    begin
		#10 Clk=1'b1;
		#10 Clk=1'b0;
		#10 Clk=1'b1;D=1'b1;
		#10 Clk=1'b0;
		#10 Clk=1'b1;
		#10 Clk=1'b0;D=1'b0;
		#10 Clk=1'b1;
		#10 Clk=1'b0;
		#10 Clk=1'b1;
		#10 Clk=1'b0;D=1'b1;
		#10 Clk=1'b1;
		#10 Clk=1'b0; D=1'b0;
		#10 Clk=1'b1;
		#10 Clk=1'b0; 
		#10 $finish;
	    end
endmodule