`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Yuxi Zhao
// Create Date: 09/20/2021 11:21:03 AM
// Design Name: 
// Module Name: divider
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


module divider(clock_in,clock_out);
    
input clock_in; // input clock on FPGA
output reg clock_out; // output clock after dividing the input clock by divisor
reg [31:0] count=32'b0;
parameter DIVISOR = 50;

// The frequency of the output clock_out = The frequency of the input clk_in divided by DIVISOR
// For example: clock_in = 5Mhz, if you want to get 100kHz signal to blink LEDs
// You will modify the DIVISOR parameter value to 50.

always @ (posedge clock_in) //count until you get to the value of 50(DIVISOR)
    begin
        if (count == DIVISOR - 1)
            count <= 32'b0;
        else
            count <= count + 1;      
    end 
    
always @ (posedge clock_in)
    begin
        if (count < DIVISOR/2)   //clock_out changes every 25(DIVISOR/2) cycles, which make its frequency 100kHz. This means it will go high once every 10us.
            clock_out <= 1;
        else
            clock_out <= 0;
    end

endmodule

