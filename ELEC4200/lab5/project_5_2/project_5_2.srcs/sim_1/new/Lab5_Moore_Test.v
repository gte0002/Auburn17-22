`timescale 1ns / 1ps

module Lab5_Moore_Test();
    wire yout;
	reg clock;
	reg reset;
	reg [1:0] ain;
 
    Lab5_Moore DUT (.yout(yout), .clock(clock), .reset(reset), .ain(ain));   
    

    initial begin
        #0  clock=0; reset=1; ain[1:0]=2'b00; //0
        #5  clock=1; reset=1; ain[1:0]=2'b00;  //5
        #5  clock=0; reset=1; ain[1:0]=2'b00;  //10
        #5  clock=1; reset=1; ain[1:0]=2'b00;  //15
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //20 
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //25
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //30
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //35
        #5  clock=0; reset=0; ain[1:0]=2'b11;  //40
        #5  clock=1; reset=0; ain[1:0]=2'b11;  //45
        #5  clock=0; reset=0; ain[1:0]=2'b10;  //50
        #5  clock=1; reset=0; ain[1:0]=2'b10;  //55
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //60
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //65
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //70
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //75
        #5  clock=0; reset=0; ain[1:0]=2'b10; //80
        #5  clock=1; reset=0; ain[1:0]=2'b10;  //85
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //90
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //95
        #5  clock=0; reset=0; ain[1:0]=2'b11;  //100
        #5  clock=1; reset=0; ain[1:0]=2'b11;  //105
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //110
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //115
        #5  clock=0; reset=0; ain[1:0]=2'b01;  //120
        #5  clock=1; reset=0; ain[1:0]=2'b01;  //125
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //130
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //135
        #5  clock=0; reset=0; ain[1:0]=2'b10;  //140
        #5  clock=1; reset=0; ain[1:0]=2'b10;  //145
        #5  clock=0; reset=0; ain[1:0]=2'b11;  //150
        #5  clock=1; reset=0; ain[1:0]=2'b11;  //155
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //160
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //165
        #5  clock=0; reset=1; ain[1:0]=2'b00;  //170
        #5  clock=1; reset=1; ain[1:0]=2'b00;  //175
        #5  clock=0; reset=0; ain[1:0]=2'b00;  //180
        #5  clock=1; reset=0; ain[1:0]=2'b00;  //185
        #5  clock=0; reset=0; ain[1:0]=2'b10;  //190
        #5  clock=1; reset=0; ain[1:0]=2'b10;  //195
        #5  clock=0; reset=0; ain[1:0]=2'b10;  //200

       
    end
endmodule