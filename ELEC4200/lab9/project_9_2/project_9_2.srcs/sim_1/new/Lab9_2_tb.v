`timescale 1ns / 1ps

module Lab9_2_tb();
    reg enable;
	wire out;

    Lab9_2 DUT ( .enable(enable), .out(out) );   
    
    initial begin
        enable = 1'b0;
        #150 enable = 1'b1;
        #450 $stop;
    end
endmodule
