`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 05:41:28 PM
// Design Name: 
// Module Name: task1sim
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


module task1sim(
    );
    reg [3:0] D;
	reg Clk;
	reg reset;
	reg load;
	wire [3:0] Q;
 
    task1 DUT (.D(D), .Clk(Clk), .reset(reset), .load(load), .Q(Q));   
    

    initial begin
        #0  D=3'b0000; reset=0; load=1; Clk =0; 
        #10  D=3'b0001; reset=0; load=1; Clk =1;  
        #10  D=3'b0010; reset=0; load=0; Clk =0;  
        #10  D=3'b0011; reset=0; load=1; Clk =1;  
        #10  D=3'b0100; reset=0; load=0; Clk =0; 
        #10  D=3'b0101; reset=1; load=1; Clk =1;
        #10  D=3'b0110; reset=0; load=1; Clk =0;
        #10  D=3'b0111; reset=0; load=1; Clk =1;
        #10  D=3'b1000; reset=0; load=1; Clk =0;
        #10  D=3'b1001; reset=0; load=0; Clk =1;
        #10  D=3'b1010; reset=0; load=1; Clk =0;
        #10  D=3'b1011; reset=0; load=1; Clk =1;
 
        

       
    end
endmodule
