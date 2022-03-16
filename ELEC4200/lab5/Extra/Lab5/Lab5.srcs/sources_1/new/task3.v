`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 06:04:41 PM
// Design Name: 
// Module Name: task3
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


module task3(clock,reset,Rom_data);
    input clock;
    input reset;
    reg [2:0] ROM [5:0];
    reg [2:0] A=0;
    output reg [2:0] Rom_data;  
    always@(posedge clock or posedge reset)
    begin
        if(reset)   //asynchrounous active high reset 
            Rom_data <= ROM[0];
        else
            
            begin //start count 
                Rom_data <= ROM[A]; 
                if (A == 5)
                    A <= 0; 
           
                else 
                    A <= A + 1; 
                    
            end
              
    end               
    initial $readmemb ("task3ROM.mem", ROM,0, 5);
endmodule 
