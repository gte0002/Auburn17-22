`timescale 1ns / 1ps

module Parallel_in_serial_out_load_enable_behavior(input Clk, input ShiftIn, input [3:0] ParallelIn, input load, input ShiftEn, output ShiftOut,output [3:0] RegContent);
    reg [3:0] shift_reg;
    always @(posedge Clk)
        if(load)
            shift_reg <= ParallelIn;
        else if (ShiftEn)
            shift_reg <= {shift_reg[2:0], ShiftIn};
        assign ShiftOut = shift_reg[3];
        assign RegContent = shift_reg;
    
endmodule
