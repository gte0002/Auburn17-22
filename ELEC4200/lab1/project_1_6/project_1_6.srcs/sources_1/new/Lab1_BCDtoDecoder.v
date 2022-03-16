`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 1
// 
// Create Date: 08/25/2021 05:55:44 PM
// Design Name: 
// Module Name: Lab1
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


module Lab1_BCDtoDecoder(bcd, seg);
    //Declare inputs,outputs and internal variables.
     input [3:0] bcd;
     output [6:0] seg;
     reg [6:0] seg;
     
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

//This function tests the Lab1_BCDtoDecoder function
module Lab1_BCDtoDecoder_testbench;

    reg [3:0] bcd;
    wire [6:0] seg;
    integer i;

    // Instantiate the Unit Under Test (UUT)
    Lab1_BCDtoDecoder uut (
        .bcd(bcd), 
        .seg(seg)
    );

//Apply inputs
    initial begin
        for(i = 0;i < 16;i = i+1) //run loop for 0 to 15.
        begin
            bcd = i; 
            #10; //wait for 10 ns
        end     
    end
      
endmodule