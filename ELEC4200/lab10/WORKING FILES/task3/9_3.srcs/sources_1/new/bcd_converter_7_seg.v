`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 01:42:22 AM
// Design Name: 
// Module Name: bcd_converter_7_seg
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


module bcd_converter_7_seg(
    input clk_in,    //default clock on board
    input reset,    //things not used on this level, but used in clk_divider
    input [3:0] v,
    output [6:0] segments,
    output [7:0] AN,
    output DCM_lock,
    output reg [3:0] tens,
    output reg [3:0] ones,
    output reg [3:0] hundreds    //wire DCM_lock;
    );
    reg clk_half_sec;     //clock at the 500Hz rate

    
    /*sets refresh rate to 500Hz */   
    wire clk_out1;  //5MHz signal
    clk_wiz_0 clockingwizard (.clk_in1(clk_in), .clk_out1(clk_out1), .locked(DCM_lock));
    integer counter = 0;

    always @(posedge clk_out1) begin 
            if (counter == (5000-1)) begin
                counter <= 0;
                clk_half_sec <= ~clk_half_sec;
                end
            else
                counter <= counter + 1;
    end
    /*end setting up the clock signal */
    
    /*How you know what to display */
    always @(posedge clk_out1)  //math only happens on pos clock edge
        begin
            hundreds = v / 7'd100;
            tens = (v / 4'd10) % 4'd10; //z turns 1 if m_out is ever greater than 10 (or A)
            ones = v % 4'd10;
        end
        
    //Display your answers!
    bcd_to_7_seg d1(.clk_in(clk_half_sec), .ones(ones), .segments(segments), .AN(AN), .tens(tens), .hundreds(hundreds));    
endmodule
