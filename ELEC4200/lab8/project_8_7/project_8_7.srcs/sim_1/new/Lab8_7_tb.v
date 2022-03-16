`timescale 1ns / 1ps

module counter_8bit_tb;
    reg Clk,Clear_n,Enable;
    wire [7:0] Q;

    dff_counter_8bit UUT(.Clk(Clk),.Clear_n(Clear_n),.Enable(Enable),.Q(Q));

    initial begin
        Clk = 0;
        forever 
        #5 Clk = ~Clk;
        end
    initial begin
        Enable = 0;
        Clear_n = 0;

        #20 Enable = 1'b1;
        #20 Clear_n = 1'b1;
        #80 Enable = 1'b0;
        #80 Enable = 1'b1;
        #300 $finish;
    end
endmodule