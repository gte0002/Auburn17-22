`timescale 1ns / 1ps

module Lab6_3(input D, input clk, input rst, output reg Q, output locked);
    wire clk5;
    wire clk_out;
    always @ (posedge clk or posedge rst)
    begin
        if (rst == 1)
            Q <= 1'b0;
        else
        //begin
            //if (D)
                Q = clk_out;
            //else 
                //Q = 0;
        //end
    end
    clk_wiz_0 UUT1 ( .clk_in1(clk), .clk_out1(clk5), .locked(locked));
    divider DUT1 (.clock_in(clk5), .clock_out(clk_out));
    
endmodule
