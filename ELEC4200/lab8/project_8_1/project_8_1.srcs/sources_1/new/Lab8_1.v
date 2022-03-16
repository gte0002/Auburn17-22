`timescale 1ns / 1ps
module Register_with_synch_reset_load_behavior(input [3:0] D, input Clk, input reset, input load, output reg [3:0] Q);
    always @(posedge Clk)
    if (reset)    
         begin
             Q <= 4'b0;
    end
    else if (load)
        begin
            Q <= D;
        end
endmodule
