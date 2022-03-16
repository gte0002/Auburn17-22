`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 07:39:40 PM
// Design Name: 
// Module Name: task4sim
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


module task4sim(
    );
    reg Clk ;
	reg ShiftIn;
	reg [3:0] ParallelIn;
	reg load;
    reg ShiftEn;
    wire  ShiftOut;
	wire [3:0] RegContent;
	
	
	
 
    task4 DUT (.Clk(Clk), .ShiftIn(ShiftIn), .ParallelIn(ParallelIn), .load(load), .ShiftEn(ShiftEn), .ShiftOut(ShiftOut), .RegContent(RegContent));   
    

    initial begin
        #0 Clk =0; load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001; //0 
        #10 Clk =1;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;   //10
        #10 Clk =0;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //20
        #10 Clk =1;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //30
        #10 Clk =0;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //40
        #10 Clk =1;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //50
        #10 Clk =0;load = 1; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //60
        #10 Clk =1;load = 1; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //70
        #10 Clk =0;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //80
        #10 Clk =1;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b0101;  //90
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //100
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //110
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //120
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //130
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //140
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //150
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //160
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b0101;  //170
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //180
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //190
        #10 Clk =0;load = 1; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //200
        #10 Clk =1;load = 1; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //210
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //220
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //230
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //240
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //250
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //260
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //270
        #5         load = 1;                                           //275
        #10 Clk =0;load = 1; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //280
        #10 Clk =1;load = 1; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //290
        #5         load = 0;                                           //295
        #10 Clk =0;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //300
        #10 Clk =1;load = 0; ShiftEn=1; ShiftIn=1; ParallelIn=4'b1001;  //310
        #10 Clk =0;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //320
        #10 Clk =1;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //330
        #10 Clk =0;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //340
        #10 Clk =1;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //350
        #10 Clk =0;load = 1; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //360
        #10 Clk =1;load = 1; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //370
        #10 Clk =0;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //380
        #10 Clk =1;load = 0; ShiftEn=0; ShiftIn=1; ParallelIn=4'b1001;  //390
    
        
 
        

       
    end
endmodule