`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 04:47:08 AM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(input clock_in, output reg clock_out);
    integer counter = 0;
    //parameter DIVISOR = 10000;
    always @(posedge clock_in)
    begin
        if(counter == 5000) begin
            counter = 0;
            clock_out = ~clock_out; end
        else
            counter = counter + 1;
    end
endmodule