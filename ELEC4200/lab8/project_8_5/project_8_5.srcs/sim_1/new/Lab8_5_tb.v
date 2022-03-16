`timescale 1ns / 1ps

module lab7_5_tb;
    reg Clk, ShiftEn, ShiftIn;
    wire [3:0] ParallelOut;
    wire ShiftOut;

    Lab7_5 DUT(.Clk(Clk),.ShiftEn(ShiftEn),.ShiftIn(ShiftIn),.ParallelOut(ParallelOut),.ShiftOut(ShiftOut));

    initial begin
        Clk = 0;
        forever begin
            #10 Clk=~Clk;
        end
    end
    initial begin
        ShiftEn = 0;
        ShiftIn = 0;

        #0 ShiftIn = 1'b1;
        #40 ShiftEn = 1'b1;
        #40 ShiftEn = 1'b0;
        #40 ShiftEn = 1'b1;
        #40 ShiftEn = 1'b0;
        #40 ShiftIn = 1'b0;
        #40 ShiftEn = 1'b1;
        #40 ShiftEn = 1'b0;
        #40 ShiftEn = 1'b1;
        #40 ShiftEn = 1'b0;
        #50 $finish;
    end
endmodule