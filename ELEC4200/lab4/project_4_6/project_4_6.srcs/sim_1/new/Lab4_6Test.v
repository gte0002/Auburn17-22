`timescale 1ns / 1ps
// Testbench for task 6 of Lab 4
module Lab4_6Test();
    reg D,Clk,reset;
    wire Q;

    Lab4_synch_reset UUT(.d(D),.clk(Clk),.clear(reset),.q(Q));
    
    initial
	begin
	    D=0;
	    Clk=0;
	    reset=0;
	    forever#10
	    Clk=~Clk;
	end
    initial
	begin
	    #10 Clk=1'b1;
	    #10 Clk=1'b0; D=1'b1;
	    #10 Clk=1'b1;
	    #5  reset=1'b1;
	    #5  Clk=1'b0; reset=1'b0;
	    #5  reset=1'b1;
	    #5  Clk=1'b1;
	    #5  reset=1'b0;
	    #5  Clk=1'b0;
	    #10 Clk=1'b1;
	    #10 Clk=1'b0;
	    #5  D=1'b0;
	    #2  reset=1'b1;
	    #3  Clk=1'b1;
	    #2  reset=1'b0;
	    #8  $finish;
	end
endmodule
