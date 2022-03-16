`timescale 1ns / 1ps

module downcounter_4bit(input Clock, input Enable,input Clear, input Load,output [3:0] Q);
    reg [3:0] count;
    wire cnt_done;

    assign cnt_done = ~| count;
    assign Q = count;

    always @(posedge Clock)
        if (Clear)
            count <= 0;
        else if (Enable)
        if (Load| cnt_done)
            count <= 4'b1010;
        else
        count <= count - 1;
endmodule