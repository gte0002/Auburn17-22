`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 04:40:03 PM
// Design Name: 
// Module Name: task2
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


module task2(input [3:0] D, input Clk, input reset, input set, input load, output reg [3:0] Q);
    always @(posedge Clk)
    if (reset)
    begin
        Q <= 4'b0;
    end
    else if (set)
    begin
        Q <= 4'b1;
    end 
    else if (load)
    begin
        Q <=D;
    end        
endmodule
