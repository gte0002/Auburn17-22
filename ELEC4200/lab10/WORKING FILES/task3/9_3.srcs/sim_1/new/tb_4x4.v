`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 11:07:39 PM
// Design Name: 
// Module Name: tb_4x4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_4x4();
    reg clk, start, reset_b;
    reg [3:0] mcand;
    reg [3:0] mplier;
    //wire done;
    wire Ready;
   
    multiplier_4x4 DUT(.Ready(Ready), .clock(clk), .Mcand(mcand),
                    .Mplier(mplier), .Start(start), .reset_b(reset_b), .segments(segments), .AN(AN));

    initial begin
        clk=0; start=0; mcand=4'b1110; mplier = 4'b1001;    //9x14
        #30 start = 1;
        #10 start= 0;
        #100 start=1; mcand = 4'b1000; mplier = 4'b0001;
        #10 start=0;
        #100 start=1; mcand = 4'b1110; mplier = 4'b1000;
        #10 start=0;
        end
    always #5 clk=~clk;
endmodule
