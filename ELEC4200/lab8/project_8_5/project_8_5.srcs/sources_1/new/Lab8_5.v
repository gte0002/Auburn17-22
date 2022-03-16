`timescale 1ns / 1ps

module Lab7_5(input Clk, input ShiftEn, input ShiftIn, output [3:0] ParallelOut, output ShiftOut);
    reg [3:0] shift_reg;

    always @(posedge Clk )
        if(ShiftEn)
            shift_reg <= {shift_reg[3:0],ShiftIn};
            assign ParallelOut = shift_reg;
            assign ShiftOut = shift_reg[3];
endmodule