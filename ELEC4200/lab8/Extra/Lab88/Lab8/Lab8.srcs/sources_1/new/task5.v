`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 09:33:04 PM
// Design Name: 
// Module Name: task5
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


module task5(input Clk, input ShiftIn, input ShiftEn, output ShiftOut, output [3:0] ParallelOut);
    reg [3:0] shift_reg    ;
    always @(posedge Clk)
        if (ShiftEn)
            shift_reg <= {shift_reg[2:0], ShiftIn}; 
    assign ShiftOut = shift_reg[3];     
    assign ParallelOut = shift_reg;      
endmodule
