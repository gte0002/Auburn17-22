`timescale 1ns / 1ps

module task1sim(
    );
    reg Clk ;
	reg load;
    reg [2:0] multiplicand;
    reg [2:0] multiplier;
    wire done;
	wire [5:0] product;
	
 
    Lab10_1 DUT (.multiplier(multiplier), .multiplicand(multiplicand), .Clk(Clk), .load(load),  .product(product), .done(done));   
    
    initial begin
        #0 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //0 
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //5
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //10
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //15
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //20
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //25
        #5 Clk =0;  load= 1; multiplicand = 3'b111; multiplier = 3'b101;  //30
        #5 Clk =1;  load= 1; multiplicand = 3'b111; multiplier = 3'b101;  //35
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //40
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //45 
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //50
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //55
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //60
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //65
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //70
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //75
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //80
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //85
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //90
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //95
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //100
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //105
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //110
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //115
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //120
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //125
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //130
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b101;  //135
        #5 Clk =0;  load= 1; multiplicand = 3'b100; multiplier = 3'b001;  //140
        #5 Clk =1;  load= 1; multiplicand = 3'b100; multiplier = 3'b001;  //145
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //150
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //155
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //160
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //165
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //170
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //175
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //180
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //185
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //190
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //195
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //200
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //205
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //210
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //215
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //220
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //225
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //230
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //235
        #5 Clk =0;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //240
        #5 Clk =1;  load= 0; multiplicand = 3'b100; multiplier = 3'b001;  //245
        #5 Clk =0;  load= 1; multiplicand = 3'b111; multiplier = 3'b100;  //250
        #5 Clk =1;  load= 1; multiplicand = 3'b111; multiplier = 3'b100;  //255
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //260
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //265
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //270
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //275
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //280
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //285
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //290
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //295
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //300
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //305
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //310
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //315
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //320
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //325
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //330
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //335
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //340
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //345
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //350
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //355
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //360
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //365
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //370
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //375
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //380
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //385
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //390
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //395                   
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //400
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //405
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //410
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //415
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //420
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //425
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //430
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //435 
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //440
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //445
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //450
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //455
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //460 
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //465
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //470
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //475
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //480 
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //485 
        #5 Clk =0;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //490 
        #5 Clk =1;  load= 0; multiplicand = 3'b111; multiplier = 3'b100;  //495
    end
endmodule
