`timescale 1ns / 1ps

module Lab7_3_tb;
    reg Clk, ShiftIn;
    wire ShiftOut;

    delay_line3_behavior UUT(.Clk(Clk), .ShiftIn(ShiftIn), .ShiftOut(ShiftOut));

    initial
         begin
             Clk = 0;
             forever 
                begin
                #10 Clk=~Clk;
                end
                 
             end
        
    initial begin
        ShiftIn = 0;

            #20 ShiftIn = 1'b1;
            #40 ShiftIn = 1'b0;
            #20 ShiftIn = 1'b1;
            #40 ShiftIn = 1'b0;
            #90 $finish;
    end
endmodule