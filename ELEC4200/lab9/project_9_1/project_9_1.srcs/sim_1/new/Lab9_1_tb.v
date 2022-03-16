`timescale 1ns / 1ps

module Lab9_1_tb();
    reg enable;
	wire out;

    Lab9_1 DUT ( .enable(enable), .out(out) );   
    
    initial begin
        enable = 1'b0;
        #150 enable = 1'b1;
        #450 $stop;
    end
endmodule