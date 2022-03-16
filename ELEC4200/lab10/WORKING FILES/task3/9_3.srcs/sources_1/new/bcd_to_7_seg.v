`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 01:18:12 AM
// Design Name: 
// Module Name: bcd_to_7_seg
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


module bcd_to_7_seg(
    output reg [6:0] segments,
    output reg [7:0] AN,
    input [3:0] ones, tens, hundreds,
    input clk_in    //500Hz
    );
    reg [1:0] count = 0;
    
    always @(posedge clk_in) begin
        if(count ==3) count <= 0;
           
        if(count==0)
            begin
                AN = 8'b11111110;
                case(ones)
                    0   :segments=7'b0000001;
                    1   :segments=7'b1001111;
                    2   :segments=7'b0010010;
                    3   :segments=7'b0000110;
                    4   :segments=7'b1001100;
                    5   :segments=7'b0100100;
                    6   :segments=7'b0100000;
                    7   :segments=7'b0001111;
                    8   :segments=7'b0000000;
                    9   :segments=7'b0000100;
                    default: segments=7'bx;
                endcase
                count <= count+1;
     end
        else if (count == 1) begin //hundreds place
                AN = 8'b11111011;
                case(hundreds)
                    0   :segments=7'b0000001;
                    1   :segments=7'b1001111;
                    2   :segments=7'b0010010;
                    3   :segments=7'b0000110;
                    4   :segments=7'b1001100;
                    5   :segments=7'b0100100;
                    6   :segments=7'b0100000;
                    7   :segments=7'b0001111;
                    8   :segments=7'b0000000;
                    9   :segments=7'b0000100;
                    default: segments=7'bx;
                endcase
                count <= count+1;
            end 
        else if (count == 2) begin //tens place
            AN = 8'b11111101;
            case(tens)
                0   :segments=7'b0000001;
                1   :segments=7'b1001111;
                2   :segments=7'b0010010;
                3   :segments=7'b0000110;
                4   :segments=7'b1001100;
                5   :segments=7'b0100100;
                6   :segments=7'b0100000;
                7   :segments=7'b0001111;
                8   :segments=7'b0000000;
                9   :segments=7'b0000100;
                default: segments=7'bx;
            endcase
            count <= count+1;
        end
    end  
endmodule
