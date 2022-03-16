`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 04:40:03 PM
// Design Name: 
// Module Name: task4
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


module task4(input Clk, input ShiftIn, input [3:0] ParallelIn,
 input load, input ShiftEn, output ShiftOut, output [3:0] RegContent);
    reg [3:0] shift_reg    ;
    always @(posedge Clk)
        if(load)
            shift_reg <= ParallelIn;
        else if (ShiftEn)
            shift_reg <= {shift_reg[2:0], ShiftIn}; 
    assign ShiftOut = shift_reg[3];     
    assign RegContent = shift_reg;      
endmodule
