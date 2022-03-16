`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 09:44:01 PM
// Design Name: 
// Module Name: task5sim
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


module task5sim(
    );
    reg Clk ;
	reg ShiftIn;
    reg ShiftEn;
    wire  ShiftOut;
	wire [3:0] ParallelOut;
	
	
	
 
    task5 DUT (.Clk(Clk), .ShiftIn(ShiftIn), .ShiftEn(ShiftEn), .ShiftOut(ShiftOut), .ParallelOut(ParallelOut));   
    

    initial begin
        #0 Clk =0;  ShiftEn=0; ShiftIn=1;  //0 
        #10 Clk =1; ShiftEn=0; ShiftIn=1;    //10
        #10 Clk =0; ShiftEn=0; ShiftIn=1;   //20
        #10 Clk =1; ShiftEn=0; ShiftIn=1;   //30
        #10 Clk =0; ShiftEn=1; ShiftIn=1;   //40
        #10 Clk =1; ShiftEn=1; ShiftIn=1;   //50
        #10 Clk =0; ShiftEn=1; ShiftIn=1;   //60
        #10 Clk =1; ShiftEn=1; ShiftIn=1;   //70
        #10 Clk =0; ShiftEn=0; ShiftIn=1;   //80
        #10 Clk =1; ShiftEn=0; ShiftIn=1;   //90
        #10 Clk =0; ShiftEn=0; ShiftIn=1;   //100
        #10 Clk =1; ShiftEn=0; ShiftIn=1;   //110
        #10 Clk =0; ShiftEn=1; ShiftIn=1;   //120
        #10 Clk =1; ShiftEn=1; ShiftIn=1;   //130
        #10 Clk =0; ShiftEn=1; ShiftIn=1;   //140
        #10 Clk =1; ShiftEn=1; ShiftIn=1;   //150
        #10 Clk =0; ShiftEn=0; ShiftIn=1;   //160
        #10 Clk =1; ShiftEn=0; ShiftIn=1;   //170
        #10 Clk =0; ShiftEn=0; ShiftIn=1;   //180
        #10 Clk =1; ShiftEn=0; ShiftIn=1;   //190
        #10 Clk =0; ShiftEn=0; ShiftIn=0;   //200
        #10 Clk =1; ShiftEn=0; ShiftIn=0;   //210
        #10 Clk =0; ShiftEn=0; ShiftIn=0;   //220
        #10 Clk =1; ShiftEn=0; ShiftIn=0;   //230
        #10 Clk =0; ShiftEn=1; ShiftIn=0;   //240
        #10 Clk =1; ShiftEn=1; ShiftIn=0;   //250
        #10 Clk =0; ShiftEn=1; ShiftIn=0;   //260
        #10 Clk =1; ShiftEn=1; ShiftIn=0;   //270
        #10 Clk =0; ShiftEn=0; ShiftIn=0;   //280
        #10 Clk =1; ShiftEn=0; ShiftIn=0;   //290
        #10 Clk =0; ShiftEn=0; ShiftIn=0;   //300
        #10 Clk =1; ShiftEn=0; ShiftIn=0;   //310
        #10 Clk =0; ShiftEn=1; ShiftIn=0;   //320
        #10 Clk =1; ShiftEn=1; ShiftIn=0;   //330
        #10 Clk =0; ShiftEn=1; ShiftIn=0;   //340
        #10 Clk =1; ShiftEn=1; ShiftIn=0;   //350
        #10 Clk =0; ShiftEn=0; ShiftIn=0;   //360
        #10 Clk =1; ShiftEn=0; ShiftIn=0;   //370
        #10 Clk =0; ShiftEn=0; ShiftIn=0;   //380
        #10 Clk =1; ShiftEn=0; ShiftIn=0;   //390
    
        
 
        

       
    end
endmodule