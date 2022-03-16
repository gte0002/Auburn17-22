`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2021 04:01:45 PM
// Design Name: 
// Module Name: task1
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


module task1(clock_in, reset, clock_out, NS_Green, NS_Red, EW_Green, EW_Red);
    input clock_in, reset;
    output clock_out;
    output reg NS_Green;
    output reg NS_Red;
    output reg EW_Green;
    output reg EW_Red;
    wire top_clock_out;
    
    reg [2:0] count=0;
    reg change_occured=0;
    parameter NS_Go = 2'b00, EW_Go = 2'b01;
    reg[1:0] state, nextstate;
    
    clk_wiz_0
   (
    // Clock out ports
    .clk_out1(top_clock_out),     // output clk_out1
    // Status and control signals
    //.reset(reset), // input reset
    //.locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clock_in));      // input clk_in1
    divider(.clockin(top_clock_out), .clockout(clock_out) );     
    
 
         
    always @ (posedge clock_out or posedge reset)
    begin 
        if (reset) 
        begin
            state <= NS_Go; 
            count <=0; 
       
        end      
        else 
        begin
            if (count<2) 
            begin
                count <= count + 1;
              
            end    
            else
            begin
                count <= 0;
                state <= nextstate;
            end              
        end           
    end            
            
    always @ (state)
        
    begin    
        case(state)
            
            NS_Go: nextstate = EW_Go;
            EW_Go:nextstate = NS_Go;
        default :nextstate =EW_Go;
        endcase
    end
    
    
    always @ (state or count or reset)
    begin
    
        case(state) 
            NS_Go: begin NS_Green =1; NS_Red =0; EW_Green = 0; EW_Red =1; end
            EW_Go: begin NS_Green =0; NS_Red =1; EW_Green = 1; EW_Red =0; end
        default: begin NS_Green =0; NS_Red =1; EW_Green = 1; EW_Red =0; end
        endcase
    end 
    
       
endmodule

module divider(clockin,clockout);
    
    input clockin; // input clock on FPGA
    //input enable;
    //input reset;
    //output reg locked;
    output reg clockout; // output clock after dividing the input clock by divisor
    reg [31:0] count=32'b0;
    parameter DIVISOR = 5000000;
    // The frequency of the output clock_out = The frequency of the input clk_in divided by DIVISOR
    // For example: clock_in = 5Mhz, if you want to get 100kHz signal to blink LEDs
    // You will modify the DIVISOR parameter value to 50. 
	
    always @ (posedge clockin) //count until you get to the value of 50(DIVISOR)
        begin
            if (count == DIVISOR - 1)
                count <= 32'b0;
            else
                count <= count + 1;      
        end 
    
    always @ (posedge clockin)
        begin
            if (count < DIVISOR/2)   //clock_out changes every 25(DIVISOR/2) cycles, which make its frequency 100kHz. This means it will go high once every 10us.
                clockout <= 1;
            else
                clockout <= 0;
        end

endmodule