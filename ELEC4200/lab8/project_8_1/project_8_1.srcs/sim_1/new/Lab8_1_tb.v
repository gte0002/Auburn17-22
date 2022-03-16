`timescale 1ns / 1ps

module Lab7_1_tb();

    reg [3:0] D;
    reg Clk, reset, load;
    wire [3:0] Q;
    Register_with_synch_reset_load_behavior UUT(.D(D), .Clk(Clk), .reset(reset), .load(load), .Q(Q));

    initial 
        begin
            Clk = 0;
            forever
            begin
            #10 Clk = ~Clk;
            end
        
    end
    initial begin
        D = 0; load = 0; reset = 0;
        #20 D = 4'b0101;
        #40 load = 1'b1;
        #20 D = 4'b1001; load = 0;
        #40 load = 1'b1;
        #20 load = 1'b0;
        #15 reset = 1'b1;
        #40 load = 1'b1;
        #20 load = 1'b0;
        #25 reset = 1'b0;
        #40 load = 1'b1;
        #40 $finish;

    end
endmodule