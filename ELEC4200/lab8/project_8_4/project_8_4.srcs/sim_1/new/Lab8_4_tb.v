`timescale 1ns / 1ps

module Lab7_4_tb;
    reg Clk, load, ShiftEn,ShiftIn;
    reg [3:0] ParallelIn;
    wire [3:0] RegContent;
    wire ShiftOut;
    Parallel_in_serial_out_load_enable_behavior DUT(.Clk(Clk),.load(load),.ShiftEn(ShiftEn),.ShiftIn(ShiftIn),.ParallelIn(ParallelIn),.RegContent(RegContent),.ShiftOut(ShiftOut));

    initial
        begin
            Clk = 0;
            forever
                begin
                    #10 Clk=~Clk;
                end
        end
    initial begin
        load = 0;
        ShiftIn = 0;
        ShiftEn = 0;

            #0 ShiftIn=1'b1; ParallelIn = 4'b0011;
            #20 ParallelIn = 4'b0101;
            #40 load = 1'b1;
            #20 load = 1'b0;
            #20 ShiftEn = 1'b1;
            #80 ParallelIn = 4'b1001;
            #20 load = 1'b1;
            #20 load = 1'b0;
            #55 load = 1'b1;
            #20 load = 1'b0;
            #25 ShiftEn = 1'b0;
            #40 load = 1'b1;
            #20 load = 1'b0;
            #30 $finish;
    end
endmodule