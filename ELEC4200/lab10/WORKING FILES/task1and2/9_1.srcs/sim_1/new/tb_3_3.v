`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 07:30:27 PM
// Design Name: 
// Module Name: tb_3_3
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


module tb_3_3();
    reg clk, start, reset_b;
    reg [2:0] mcand;
    reg [2:0] mplier;
    wire done;
    wire [5:0] product;

   
    Multiplier_3_3 DUT(.done(done), .clock(clk), .Product(product), .Multiplicand(mcand),
                    .Multiplier(mplier), .Start(start), .reset_b(reset_b));

    initial begin
        clk=0; start=0; mcand=3'b111; mplier = 3'b101;
        #30 start = 1;
        #10 start= 0;
        #100 start=1; mcand = 3'b100; mplier = 3'b001;
        #10 start=0;
        #100 start=1; mcand = 3'b111; mplier = 3'b100;
        #10 start=0;
        end
    always #5 clk=~clk;
endmodule
