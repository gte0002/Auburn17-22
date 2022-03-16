`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 2
// 
// Create Date: 09/01/2021 05:17:35 PM
// Design Name: 
// Module Name: Lab2_RCA_BCD
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


module Lab2_RCA_BCD(a, b, cin, cout, s);
    input [3:0] a,b; 
    input cin;
    output [3:0] s, x;
    output cout, y;
    wire w1,w2,w3;
    
    fulladder f0(a[0],b[0],0,s[0],w1);
    fulladder f1(a[1],b[1],w1,s[1],w2);
    fulladder f2(a[2],b[2],w2,s[2],w3);
    fulladder f3(a[3],b[3],w3,s[3],cout);
    
    always @(s)
    begin
        if(s < 4'b1001)
            {y,x} = {1'b0,s};
        else
        begin
            y=1'b1;
            x=v-4'b1010;
        end
        case (x) //case statement
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
