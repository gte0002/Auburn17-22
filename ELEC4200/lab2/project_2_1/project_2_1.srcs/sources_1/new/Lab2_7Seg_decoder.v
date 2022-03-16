`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 2
// 
// Create Date: 09/01/2021 04:01:44 PM
// Design Name: 
// Module Name: Lab2_7Seg_decoder
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


module Lab2_7Seg_decoder(bcd, seg, set0);
    //Declare inputs,outputs and internal variables.
     input [3:0] bcd;
     output [6:0] seg;
     reg [6:0] seg;
     output [7:0] set0;
     assign set0 = 8'b11111110;
     //Converts bcd digit to 7 segment
    always @(bcd)
    begin
        case (bcd) //case statement
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0000100;
            //switch off 7 segment character if bcd digit != decimal number.
            default : seg = 7'b1111111; 
        endcase
    end
endmodule
