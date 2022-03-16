`timescale 1ns / 1ps

module Lab5_ROM_Test();
    reg clock;
	reg reset;
	wire [2:0] Rom_data;
 
    Lab5_Mealy_ROM DUT (.clock(clock), .reset(reset), .Rom_data(Rom_data));   
    

    initial begin
        #0  clock=0; reset=1; //0
        #5  clock=1; reset=1;   //5
        #5  clock=0; reset=1;   //10
        #5  clock=1; reset=0;  //15
        #5  clock=0; reset=0;  //20
        #5  clock=1; reset=0;  //25
        #5  clock=0; reset=0;   //30
        #5  clock=1; reset=0; //35
        #5  clock=0; reset=0;   //40
        #5  clock=1; reset=0;  //45
        #5  clock=0; reset=0;   //50
        #5  clock=1; reset=0;  //55
        #5  clock=0; reset=0; //60
        #5  clock=1; reset=0; //65
        #5  clock=0; reset=0;  //70
        #5  clock=1; reset=0;   //75
        #5  clock=0; reset=0;   //80
        #5  clock=1; reset=0;   //85
        #5  clock=0; reset=0;  //90
        #5  clock=1; reset=0;   //95
        #5  clock=0; reset=0;   //100
        #5  clock=1; reset=0;   //105
        #5  clock=0; reset=0;   //10
        #5  clock=1; reset=0;  //15
        #5  clock=0; reset=1;  //20
        #5  clock=1; reset=1;  //25
        #5  clock=0; reset=1;   //30
        #5  clock=1; reset=1; //35
        #5  clock=0; reset=0;   //40
        #5  clock=1; reset=0;  //45
        #5  clock=0; reset=0;   //50
        #5  clock=1; reset=0;  //55
        #5  clock=0; reset=0; //60
        #5  clock=1; reset=0; //65
        #5  clock=0; reset=0;  //70
        #5  clock=1; reset=0;   //75
        #5  clock=0; reset=0;   //80
        #5  clock=1; reset=0;   //85
        #5  clock=0; reset=0;  //90
        #5  clock=1; reset=0;   //95
        #5  clock=0; reset=0;   //100
        #5  clock=1; reset=0;   //105
    end
    
endmodule