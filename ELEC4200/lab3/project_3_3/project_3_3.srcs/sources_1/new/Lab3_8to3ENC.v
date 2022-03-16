`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 3
// 
// Create Date: 09/06/2021 03:47:29 PM
// Design Name: 
// Module Name: Lab3_8to3ENC
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


module Lab3_8to3ENC(v,E1,y,E0,GS);
    input [7:0]v;
    input E1;
    output reg [2:0]y;
    output reg GS,E0;
    
    always @ (v,E1)
    begin 
        if(E1==1'b0)
        begin
            casex(v)
            8'bxxxxxxx0 : begin
                            y = 3'b000;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end 
            8'bxxxxxx01 : begin
                            y = 3'b001;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end
            8'bxxxxx011 : begin 
                            y = 3'b010;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end
            8'bxxxx0111 : begin 
                            y = 3'b011;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end
            8'bxxx01111 : begin 
                            y = 3'b100;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end
            8'bxx011111 : begin 
                            y = 3'b101;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end
            8'bx0111111 : begin 
                            y = 3'b110;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end
            8'b01111111 : begin
                            y = 3'b111;
                            E0 = 1'b1; 
                            GS = 1'b0;
                          end
            8'b11111111 : begin
                            y = 3'b111;
                            E0 = 1'b0; 
                            GS = 1'b1;
                          end
            endcase
        end
        else
        begin
            y = 3'b111;
            E0 = 1'b1;
            GS = 1'b1;
        end
    end
endmodule
