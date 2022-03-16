`timescale 1ns / 1ps
// Testbench for task 5 of Lab 4
module Lab4_5Test();
    reg D,Clk;
	wire Qa,Qb,Qc;
	
	Lab5_5 UUT(.D(D),.Clk(Clk),.Qa(Qa),.Qb(Qb),.Qc(Qc));

	initial
	    begin
		D=0;
		Clk=0;
	    	forever #10
		Clk=Clk;
	    end
	initial
	    begin
		#10 D=1'b1;
		#5 Clk=1'b1; 
		#5 D=1'b0;
		#5 D=1'b1;
		#10 D=1'b0;
		#10 Clk=1'b0;
		#5 D=1'b1;
		#10 D=1'b0;
		#5 D=1'b1;
		#5 D=1'b0;
		#5 Clk=1'b1;
		#5 D=1'b1;
		#5 D=1'b0;
		#5 D=1'b1;
		#15 Clk=1'b0;
		#5 D=1'b0; 
		#40 $finish;
	    end
endmodule
