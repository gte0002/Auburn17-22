`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:54:13 PM
// Design Name: 
// Module Name: Lab4_DSynch_clock
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


module Lab4_DSynch_clock(Clk,CE,reset,D,set,Q);
    input Clk;
    input CE;
    input reset;
    input D;
    input set;
//list the outputs 
    output Q;
//Internal variables
    reg Q;
     
    //flip flop state is affected only on postive edge of clock 
    always @(posedge(Clk))
    begin
        if(Clk == 1) 
        begin
            if (reset == 1) //check for active high reset
                Q = 0;  
            else if(set == 1)   //check for set
                Q = 1; 
            else if (CE == 1) //check if clock is enabled
                Q = D;       
        end      
    end
endmodule
