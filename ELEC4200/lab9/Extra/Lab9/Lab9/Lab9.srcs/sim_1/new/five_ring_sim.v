`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 12:40:01 PM
// Design Name: 
// Module Name: five_ring_sim
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


module five_ring_sim(
    );
	reg enable;
	wire out;
	/*
	wire w1; 
	wire w2;
	wire w3;
	wire w4;
	wire w5;
	wire w6;
	*/
	
	
	
	
 
    //five_ring DUT ( .enable(enable), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6), .out(out) ); 
    five_ring DUT ( .enable(enable), .out(out) );   
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    enable = 1'b?;
    #1000 enable = 1'b0;
    #150 enable = 1'b1;
    #450 $stop;
    end
    /*
    initial begin
    enable = 1'b0;
    #1000
    enable = 1'b1;
    end
    */
endmodule
