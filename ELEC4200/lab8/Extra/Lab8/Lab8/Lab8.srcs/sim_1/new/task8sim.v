`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 12:45:58 PM
// Design Name: 
// Module Name: task8sim
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


module task8sim(
    );
    reg Clk ;
	reg enable;
    reg clear;
    reg  load;
	wire [3:0] Q;
	
	
	
 
    task8 DUT (.Clk(Clk), .enable(enable), .clear(clear), .load(load), .Q(Q));   
    

    initial begin
        #0 Clk =0;  enable=0; clear=0; load=0;  //0 
        #5 Clk =1;  enable=0; clear=0; load=0;  //5
        #5 Clk =0;  enable=0; clear=0; load=0;   //10
        #5 Clk =1;  enable=0; clear=0; load=0;  //15
        #5 Clk =0;  enable=1; clear=0; load=0;  //20
        #5 Clk =1;  enable=1; clear=0; load=0;  //25
        #5 Clk =0;  enable=1; clear=0; load=0;  //30
        #5 Clk =1;  enable=1; clear=0; load=0;  //35
        #5 Clk =0;  enable=1; clear=1; load=0;  //40
        #5 Clk =1;  enable=1; clear=1; load=0;  //45 
        #5 Clk =0;  enable=1; clear=1; load=0;  //50
        #5 Clk =1;  enable=1; clear=1; load=0;  //55
        #5 Clk =0;  enable=1; clear=0; load=0;  //60
        #5 Clk =1;  enable=1; clear=0; load=0;  //65
        #5 Clk =0;  enable=1; clear=0; load=0;  //70
        #5 Clk =1;  enable=1; clear=0; load=0;  //75
        #5 Clk =0;  enable=1; clear=0; load=1;  //80
        #5 Clk =1;  enable=1; clear=0; load=1;  //85
        #5 Clk =0;  enable=1; clear=0; load=0;  //90
        #5 Clk =1;  enable=1; clear=0; load=0;  //95
        #5 Clk =0;  enable=1; clear=0; load=0;  //100
        #5 Clk =1;  enable=1; clear=0; load=0;  //105
        #5 Clk =0;  enable=1; clear=0; load=0;  //110
        #5 Clk =1;  enable=1; clear=0; load=0;  //115
        #5 Clk =0;  enable=1; clear=0; load=0;  //120
        #5 Clk =1;  enable=1; clear=0; load=0;  //125
        #5 Clk =0;  enable=1; clear=0; load=0;  //130
        #5 Clk =1;  enable=1; clear=0; load=0;  //135
        #5 Clk =0;  enable=1; clear=0; load=0;  //140
        #5 Clk =1;  enable=1; clear=0; load=0;  //145
        #5 Clk =0;  enable=1; clear=0; load=0;  //150
        #5 Clk =1;  enable=1; clear=0; load=0;  //155
        #5 Clk =0;  enable=1; clear=0; load=0;  //160
        #5 Clk =1;  enable=0; clear=0; load=0;  //165
        #5 Clk =0;  enable=0; clear=0; load=0;  //170
        #5 Clk =1;  enable=0; clear=0; load=0;  //175
        #5 Clk =0;  enable=0; clear=0; load=0;  //180
        #5 Clk =1;  enable=0; clear=0; load=0;  //185
        #5 Clk =0;  enable=0; clear=0; load=0;  //190
        #5 Clk =1;  enable=0; clear=0; load=0;  //195
        #5 Clk =0;  enable=0; clear=0; load=0;  //200
        #5 Clk =1;  enable=0; clear=0; load=0;  //205
        #5 Clk =0;  enable=1; clear=0; load=0;  //210
        #5 Clk =1;  enable=1; clear=0; load=0;  //215
        #5 Clk =0;  enable=1; clear=0; load=0;  //220
        #5 Clk =1;  enable=1; clear=0; load=0;  //225
        #5 Clk =0;  enable=1; clear=0; load=0;  //230
        #5 Clk =1;  enable=1; clear=0; load=0;  //235
        #5 Clk =0;  enable=1; clear=0; load=0;  //240
        #5 Clk =1;  enable=1; clear=0; load=0;  //245
        #5 Clk =0;  enable=1; clear=0; load=0;  //250
        #5 Clk =1;  enable=1; clear=0; load=0;  //255
        #5 Clk =0;  enable=1; clear=0; load=0;  //260
        #5 Clk =1;  enable=1; clear=0; load=0;  //265
        #5 Clk =0;  enable=1; clear=0; load=0;  //270
        #5 Clk =1;  enable=1; clear=0; load=0;  //275
        #5 Clk =0;  enable=1; clear=0; load=0;  //280
        #5 Clk =1;  enable=1; clear=0; load=0;  //285
        #5 Clk =0;  enable=1; clear=0; load=0;  //290
        #5 Clk =1;  enable=1; clear=0; load=0;  //295
        #5 Clk =0;  enable=1; clear=0; load=0;  //300
        #5 Clk =1;  enable=1; clear=0; load=0;  //305
        #5 Clk =0;  enable=1; clear=0; load=0;  //310
        #5 Clk =1;  enable=1; clear=0; load=0;  //315
        #5 Clk =0;  enable=1; clear=0; load=0;  //320
        #5 Clk =1;  enable=1; clear=0; load=0;  //325
        #5 Clk =0;  enable=1; clear=0; load=0;  //330
        #5 Clk =1;  enable=1; clear=0; load=0;  //335
        #5 Clk =0;  enable=1; clear=0; load=0;  //340
        #5 Clk =1;  enable=1; clear=0; load=0;  //345
        #5 Clk =0;  enable=1; clear=0; load=0;  //350
        #5 Clk =1;  enable=1; clear=0; load=0;  //355
        #5 Clk =0;  enable=1; clear=0; load=0;  //360
        #5 Clk =1;  enable=1; clear=0; load=0;  //365
        #5 Clk =0;  enable=1; clear=0; load=0;  //370
        #5 Clk =1;  enable=1; clear=0; load=0;  //375
        #5 Clk =0;  enable=1; clear=0; load=0;  //380
        #5 Clk =1;  enable=1; clear=0; load=0;  //385
        #5 Clk =0;  enable=1; clear=0; load=0;  //390
        #5 Clk =1;  enable=1; clear=0; load=0;  //395
    
        
 
        

       
    end
endmodule
