`timescale 1ns / 1ps
// Testbench for task 3 of Lab 4

module Lab4_3Test ();
    reg D,Enable,clk;
	wire Q,Qbar;
	
	Lab4_D_dataflow UUT(.D(D),.Enable(Enable),.Q(Q),.Qbar(Qbar));

	initial
	    begin
		D=0;
		Enable=0;
		clk=0;
	    forever#10
		clk=~clk;
	    end
	initial
	    begin
		#10 D=1'b1;
		#10 Enable=1'b1;
		#10 D=1'b0;
		#10 D=1'b1;
		#10 Enable=1'b0;
		#10 D=1'b0;
		#10 D=1'b1;
		#10 D=1'b0;
		#10 Enable=1'b1;
		#10 D=1'b1;
		#10 D=1'b0; 
		#90 $finish;
	    end
endmodule