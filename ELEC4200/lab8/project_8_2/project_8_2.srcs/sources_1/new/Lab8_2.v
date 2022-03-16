`timescale 1ns / 1ps

module Register_with_synch_reset_set_load_ehavior(input [3:0]D, input Clk, input reset, input set, input load, output reg [3:0] Q);

    always @(posedge Clk)
    if (reset)
        begin
            Q <= 4'b0;
        end
    else if (set)
        begin
            Q <= 4'b1;
        end
    else if (load)
        begin
            Q <= D;
        end
endmodule