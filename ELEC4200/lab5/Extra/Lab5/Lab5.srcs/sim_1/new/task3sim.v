`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 06:06:01 PM
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
    reg clock;
	reg reset;
	wire [2:0] Rom_data;
 
    task3 DUT (.clock(clock), .reset(reset), .Rom_data(Rom_data));   
    

    initial begin
        #0  clock=0; reset=1; //0
        #10  clock=1; reset=1;   //5
        #10  clock=0; reset=1;   //10
        #10  clock=1; reset=0;  //20
        #10  clock=0; reset=0;  //30
        #10  clock=1; reset=0;  //40
        #10  clock=0; reset=0;   //50
        #10  clock=1; reset=0; //60
        #10  clock=0; reset=0;   //70
        #10  clock=1; reset=0;  //80
        #10  clock=0; reset=0;   //90
        #10  clock=1; reset=0;  //100
        #10  clock=0; reset=0; //110
        #10  clock=1; reset=1; //120
        #10  clock=0; reset=1;  //130
        #10  clock=1; reset=0;   //140
        #10  clock=0; reset=0;   //150
        #10  clock=1; reset=0;   //160
        #10  clock=0; reset=0;  //170
        #10  clock=1; reset=0;   //180
        #10  clock=0; reset=0;   //190
        #10  clock=1; reset=0;   //195

       
    end
endmodule

