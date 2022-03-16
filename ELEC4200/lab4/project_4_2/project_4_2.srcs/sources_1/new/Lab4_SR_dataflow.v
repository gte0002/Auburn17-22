`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:24:31 PM
// Design Name: 
// Module Name: Lab4_SR_dataflow
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


module Lab4_SR_dataflow(q,qbar,en,s,r);
    input s,r,en;
    output reg q, qbar;

    always@(en)
    if (en == 1)
    begin
        if(s == 1 & r == 1) 
            begin 
                q = 0;
                qbar = 0;
            end
        else if(s == 1)
        begin
            q = 1;
            qbar = 0;
        end
        
        else if(r == 1)
        begin
            q = 0;
            qbar = 1;
        end
        
        else if(s == 0 & r == 0) 
        begin 
            q <= q;
            qbar <= qbar;
        end
    end
endmodule