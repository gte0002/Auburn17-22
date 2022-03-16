

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2020 10:23:12 PM
// Design Name: 
// Module Name: display
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

module lab2_task2(
    input [3:0] v,
    output [6:0] seg0,
    output [7:0] AN,
    output z);
    
    wire [2:0] A_output;
    wire [3:0] m_out;
    
    comparator_4bit C1(v, 9, z);
    circuitA A1(v[2:0], A_output);
    Mux21 m1(0, v[3], z, m_out[3]);
    Mux21 m2(A_output[2], v[2], z, m_out[2]);
    Mux21 m3(A_output[1], v[1], z, m_out[1]);
    Mux21 m4(A_output[0], v[0], z, m_out[0]);
    seg_display(m_out, AN, seg0); //7 segment display
    
endmodule


module comparator_4bit
    (input [3:0] v,
    input [3:0] compare,
    output reg result);
    always @ (v or compare)
        begin
            if (v > compare)result = 1;
            else
            result = 0;
        end
endmodule

module circuitA (input [2:0] v,output reg [2:0] result);
    always @ (v)
        begin
            case (v)
                2   :result=3'b000;
                3   :result=3'b001;
                4   :result=3'b010;
                5   :result=3'b011;
                6   :result=3'b100;
                7   :result=3'b101;
                default :result=3'bx;
            endcase
        end     
endmodule

module Mux21(input x,input y,input s,output reg m);
    always @ (x or y or s)
        begin
            if (s == 0)
                m = y;  
            else
                m = x;
        end    
endmodule

module seg_display(
    input [3:0] m_out, //first digit
    output reg [7:0] AN, 
    output reg [6:0] seg0 //7 segment display
    );
        always @(m_out)

            begin
                AN = 8'b11111110;
                case(m_out)
                    0   :seg0=7'b0000001;
                    1   :seg0=7'b1001111;
                    2   :seg0=7'b0010010;
                    3   :seg0=7'b0000110;
                    4   :seg0=7'b1001100;
                    5   :seg0=7'b0100100;
                    6   :seg0=7'b0100000;
                    7   :seg0=7'b0001111;
                    8   :seg0=7'b0000000;
                    9   :seg0=7'b0000100;
                    default: seg0=7'bx;
                endcase
            end

endmodule


