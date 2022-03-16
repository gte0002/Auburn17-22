`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 11:57:53 PM
// Design Name: 
// Module Name: task6sim
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


module task6sim(
    );
    reg Clk ;
	reg T;
    reg clearN;
    
	wire [7:0] out;
	
	
	
 
    task6 DUT (.Clk(Clk), .T(T), .clearN(clearN), .out(out));   
    

    initial begin
        #0 Clk =0;  T=0; clearN=0;  //0 
        #5 Clk =1;  T=0; clearN=0;  //5
        #5 Clk =0;  T=0; clearN=0;   //10
        #5 Clk =1;  T=0; clearN=0;  //15
        #5 Clk =0;  T=1; clearN=0;  //20
        #5 Clk =1;  T=1; clearN=0;  //25
        #5 Clk =0;  T=1; clearN=0;  //30
        #5 Clk =1;  T=1; clearN=0;  //35
        #5 Clk =0;  T=1; clearN=1;  //40
        #5 Clk =1;  T=1; clearN=1;  //45 
        #5 Clk =0;  T=1; clearN=1;  //50
        #5 Clk =1;  T=1; clearN=1;  //55
        #5 Clk =0;  T=1; clearN=1;  //60
        #5 Clk =1;  T=1; clearN=1;  //65
        #5 Clk =0;  T=1; clearN=1;  //70
        #5 Clk =1;  T=1; clearN=1;  //75
        #5 Clk =0;  T=1; clearN=1;  //80
        #5 Clk =1;  T=1; clearN=1;  //85
        #5 Clk =0;  T=1; clearN=1;  //90
        #5 Clk =1;  T=1; clearN=1;  //95
        #5 Clk =0;  T=1; clearN=1;  //100
        #5 Clk =1;  T=1; clearN=1;  //105
        #5 Clk =0;  T=1; clearN=1;  //110
        #5 Clk =1;  T=0; clearN=1;  //115
        #5 Clk =0;  T=0; clearN=1;  //120
        #5 Clk =1;  T=0; clearN=1;  //125
        #5 Clk =0;  T=0; clearN=1;  //130
        #5 Clk =1;  T=0; clearN=1;  //135
        #5 Clk =0;  T=0; clearN=1;  //140
        #5 Clk =1;  T=0; clearN=1;  //145
        #5 Clk =0;  T=0; clearN=1;  //150
        #5 Clk =1;  T=0; clearN=1;  //155
        #5 Clk =0;  T=0; clearN=1;  //160
        #5 Clk =1;  T=0; clearN=1;  //165
        #5 Clk =0;  T=0; clearN=1;  //170
        #5 Clk =1;  T=0; clearN=1;  //175
        #5 Clk =0;  T=0; clearN=1;  //180
        #5 Clk =1;  T=0; clearN=1;  //185
        #5 Clk =0;  T=0; clearN=1;  //190
        #5 Clk =1;  T=0; clearN=1;  //195
        #5 Clk =0;  T=1; clearN=1;  //200
        #5 Clk =1;  T=1; clearN=1;  //205
        #5 Clk =0;  T=1; clearN=1;  //210
        #5 Clk =1;  T=1; clearN=1;  //215
        #5 Clk =0;  T=1; clearN=1;  //220
        #5 Clk =1;  T=1; clearN=1;  //225
        #5 Clk =0;  T=1; clearN=1;  //230
        #5 Clk =1;  T=1; clearN=1;  //235
        #5 Clk =0;  T=1; clearN=1;  //240
        #5 Clk =1;  T=1; clearN=1;  //245
        #5 Clk =0;  T=1; clearN=1;  //250
        #5 Clk =1;  T=1; clearN=1;  //255
        #5 Clk =0;  T=1; clearN=1;  //260
        #5 Clk =1;  T=1; clearN=1;  //265
        #5 Clk =0;  T=1; clearN=1;  //270
        #5 Clk =1;  T=1; clearN=1;  //275
        #5 Clk =0;  T=1; clearN=1;  //280
        #5 Clk =1;  T=1; clearN=1;  //285
        #5 Clk =0;  T=1; clearN=1;  //290
        #5 Clk =1;  T=1; clearN=1;  //295
        #5 Clk =0;  T=1; clearN=1;  //300
        #5 Clk =1;  T=1; clearN=1;  //305
        #5 Clk =0;  T=1; clearN=1;  //310
        #5 Clk =1;  T=1; clearN=1;  //315
        #5 Clk =0;  T=1; clearN=1;  //320
        #5 Clk =1;  T=1; clearN=1;  //325
        #5 Clk =0;  T=1; clearN=1;  //330
        #5 Clk =1;  T=1; clearN=1;  //335
        #5 Clk =0;  T=1; clearN=1;  //340
        #5 Clk =1;  T=1; clearN=1;  //345
        #5 Clk =0;  T=1; clearN=1;  //350
        #5 Clk =1;  T=1; clearN=1;  //355
        #5 Clk =0;  T=1; clearN=1;  //360
        #5 Clk =1;  T=1; clearN=1;  //365
        #5 Clk =0;  T=1; clearN=1;  //370
        #5 Clk =1;  T=1; clearN=1;  //375
        #5 Clk =0;  T=1; clearN=1;  //380
        #5 Clk =1;  T=1; clearN=1;  //385
        #5 Clk =0;  T=1; clearN=1;  //390
        #5 Clk =1;  T=1; clearN=1;  //395
        #5 Clk =0;  T=1; clearN=1;  //400
        #5 Clk =1;  T=1; clearN=1;  //405
        #5 Clk =0;  T=1; clearN=1;  //410
        #5 Clk =1;  T=1; clearN=1;  //415
        #5 Clk =0;  T=1; clearN=1;  //420
        #5 Clk =1;  T=1; clearN=1;  //425
        #5 Clk =0;  T=1; clearN=1;  //430
        #5 Clk =1;  T=1; clearN=1;  //435
        #5 Clk =0;  T=1; clearN=1;  //440
        #5 Clk =1;  T=1; clearN=1;  //445
        #5 Clk =0;  T=1; clearN=1;  //450
        #5 Clk =1;  T=1; clearN=1;  //455
        #5 Clk =0;  T=1; clearN=1;  //460
        #5 Clk =1;  T=1; clearN=1;  //465
        #5 Clk =0;  T=1; clearN=1;  //470
        #5 Clk =1;  T=1; clearN=1;  //475
        #5 Clk =0;  T=1; clearN=1;  //480
        #5 Clk =1;  T=1; clearN=1;  //485
        #5 Clk =0;  T=1; clearN=1;  //490
        #5 Clk =1;  T=1; clearN=1;  //495
        
        
        
    
        
 
        

       
    end
endmodule
