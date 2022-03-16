`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 06:28:43 PM
// Design Name: 
// Module Name: task3sim
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


module task3sim(
    );
    reg Clk ;
	reg ShiftIn;
	wire  ShiftOut;
	
	
 
    task3 DUT (.Clk(Clk), .ShiftIn(ShiftIn), .ShiftOut(ShiftOut));   
    

    initial begin
        #0 Clk =0; ShiftIn = 0; //0 
        #10 Clk =1;ShiftIn = 0;    //10
        #10 Clk =0;ShiftIn = 1;    //20
        #10 Clk =1;ShiftIn = 1;    //30
        #10 Clk =0;ShiftIn = 1;    //40
        #10 Clk =1;ShiftIn = 1;    //50
        #10 Clk =0;ShiftIn = 0;    //60
        #10 Clk =1;ShiftIn = 0;    //70
        #10 Clk =0;ShiftIn = 1;    //80
        #10 Clk =1;ShiftIn = 1;    //90
        #10 Clk =0;ShiftIn = 1;    //100
        #10 Clk =1;ShiftIn = 1;    //110
        #10 Clk =0;ShiftIn = 0;    //120
        #10 Clk =1;ShiftIn = 0;    //130
        #10 Clk =0;ShiftIn = 0;    //140
        #10 Clk =1;ShiftIn = 0;    //150
        #10 Clk =0;ShiftIn = 0;    //160
        #10 Clk =1;ShiftIn = 0;    //170
        #10 Clk =0;ShiftIn = 0;    //180
        #10 Clk =1;ShiftIn = 0;    //190
        #10 Clk =0;ShiftIn = 0;    //200
        
 
        

       
    end
endmodule

