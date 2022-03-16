`timescale 1ns / 1ps

module Lab7_8_tb;
reg Clock,Enable,Clear,Load;
wire [3:0] Q;

downcounter_4bit UUT(.Clock(Clock),.Enable(Enable),.Clear(Clear),.Load(Load),.Q(Q));

initial begin
    Clock = 0;
    forever
        begin
        #5 Clock = ~Clock;
        end
end
initial begin
    Clock=0; Enable=0;Clear=0; Load=0;

    #20 Enable = 1'b1;
    #20 Clear = 1'b1;
    #20 Clear = 1'b0;
    #20 Load = 1'b1;
    #10 Load = 1'b0;
    #80 Enable = 1'b0;
    #40 Enable = 1'b1;
    #220 $finish; 
end    
endmodule