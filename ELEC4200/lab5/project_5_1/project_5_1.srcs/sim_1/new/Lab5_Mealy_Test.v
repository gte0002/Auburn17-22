`timescale 1ns / 1ps

module Lab5_Mealy_Test();
    reg clock;
	reg reset;
	reg ain;
	wire [3:0] count;
	wire yout;
 
    Lab5_Mealy DUT (.clock(clock), .reset(reset), .ain(ain), .count(count), .yout(yout));   
    

    initial begin
        #0  clock=0; reset=1; ain=0; //0
        #5  clock=1; reset=1; ain=0;  //5
        #5  clock=0; reset=1; ain=0;  //10
        #5  clock=1; reset=1; ain=0;  //15
        #5  clock=0; reset=0; ain=0;  //20 
        #5  clock=1; reset=0; ain=0;  //25
        #5  clock=0; reset=0; ain=0;  //30
        #5  clock=1; reset=0; ain=0;  //35
        #5  clock=0; reset=0; ain=1;  //40
        #5  clock=1; reset=0; ain=1;  //45
        #5  clock=0; reset=0; ain=1;  //50
        #5  clock=1; reset=0; ain=1;  //55
        #5  clock=0; reset=0; ain=0;  //60
        #5  clock=1; reset=0; ain=0;  //65
        #5  clock=0; reset=0; ain=0;  //70
        #5  clock=1; reset=0; ain=0;  //75
        #5  clock=0; reset=0; ain=0; //80
        #5  clock=1; reset=0; ain=0;  //85
        #5  clock=0; reset=0; ain=0;  //90
        #5  clock=1; reset=0; ain=0;  //95
        #5  clock=0; reset=0; ain=0;  //100
        #5  clock=1; reset=0; ain=0;  //105
        #5  clock=0; reset=0; ain=0;  //110
        #5  clock=1; reset=0; ain=0;  //115
        #5  clock=0; reset=0; ain=1;  //120
        #5  clock=1; reset=0; ain=1;  //125
        #5  clock=0; reset=0; ain=1;  //130
        #5  clock=1; reset=0; ain=1;  //135
        #5  clock=0; reset=0; ain=1;  //140
        #5  clock=1; reset=0; ain=1;  //145
        #5  clock=0; reset=0; ain=1;  //150
        #5  clock=1; reset=0; ain=1;  //155
        #5  clock=0; reset=0; ain=0;  //160
        #5  clock=1; reset=0; ain=0;  //165
        #5  clock=0; reset=0; ain=0;  //170
        #5  clock=1; reset=0; ain=0;  //175
        #5  clock=0; reset=0; ain=1;  //180
        #5  clock=1; reset=0; ain=1;  //185
        #5  clock=0; reset=1; ain=1;  //190
        #5  clock=1; reset=1; ain=1;  //195
        #5  clock=0; reset=1; ain=1;  //200

       
    end

endmodule