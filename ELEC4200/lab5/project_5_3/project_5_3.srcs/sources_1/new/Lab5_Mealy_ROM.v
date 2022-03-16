`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 5
// 
// Create Date: 09/20/2021 03:13:30 PM
// Design Name: 
// Module Name: Lab5_Mealy_ROM
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


module Lab5_Mealy_ROM(clock,reset,count);
    
    input clock, reset;
    output reg [2:0] count;
    
        reg [5:0] ROM [0:5];
        initial $readmemb ("task3ROM.mem", ROM, 0, 5);
    
        reg [2:0] state, nextstate;
        parameter s0=0, s1=1, s2=2,s3=3, s4=4, s5=5;
    
        always @ (posedge clock or posedge reset)
            begin
            if(reset)
                 state <= s0;
            else
                 state <= nextstate;
             end
        always @ (state)
             begin
            nextstate = 0;
            {count, nextstate} = ROM[state];
             end
                       
endmodule
