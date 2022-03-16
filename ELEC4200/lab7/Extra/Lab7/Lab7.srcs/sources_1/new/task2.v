`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2021 04:01:45 PM
// Design Name: 
// Module Name: task2
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


module task2(clock_in, reset, clock_out, NS_Green, NS_Yellow, NS_Red, EW_Green, EW_Yellow, EW_Red);
    input clock_in, reset;
    output clock_out;
    output reg NS_Green;
    output reg NS_Yellow;
    output reg NS_Red;
    output reg EW_Green;
    output reg EW_Yellow;
    output reg EW_Red;
    wire top_clock_out;
    
    reg [1:0] count_green =0; 
    reg [1:0] count_yellow =0; 
    reg [1:0] count_red =0; 

    reg change_occured=0;
    parameter State_NS_Green = 3'b000, State_NS_Yellow= 3'b001, State_NS_Red= 3'b010, State_EW_Green = 3'b011, State_EW_Yellow = 3'b100, State_EW_Red = 3'b101;
    reg[2:0] state, nextstate;
    
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
        begin state <= State_NS_Green;count_green <=0;count_yellow <=0; count_red <=0;end      
        else 
        begin
            if (count_green<2) 
            begin count_green <= count_green + 1; end    
            else 
            begin
                count_green <= 0; if (state == State_NS_Green) begin state <= nextstate; end else if (state == State_EW_Green)begin state <= nextstate; end
            end 
            if (count_yellow<1) begin count_yellow <= count_yellow + 1; end
            else
            begin
                count_yellow <= 0;
                begin if (state == State_NS_Yellow) /*NS YELLOW*/ begin state <= nextstate; end  else if (state == State_EW_Yellow) /* NS RED */begin state <= nextstate; end         
                end                          
            end 
            if (count_red<1) begin count_red <= count_red + 1; end    
            else 
            begin
                count_red <= 0; 
                begin if (state == State_NS_Red) begin state <= nextstate; end else if (state == State_EW_Red)begin state <= nextstate; end
                end
            end                                         
        end 
          
    end    
/*   
    always @ (posedge clock_out)
    begin
        if (count_red_yellow<1)
        begin
            count_red_yellow <= count_red_yellow + 1;
        end
        else
        begin
            count_red_yellow <= 0;
            begin
                if (state == 3'b001) //NS YELLOW
                begin
                    state <= nextstate;
                end
                else if (state == 3'b010) // NS RED
                begin
                    state <= nextstate;
                end      
                else if (state == 3'b100) // EW YELLOW
                begin
                    state <= nextstate;
                end 
                else if (state == 3'b101) // EW RED
                begin
                    state <= nextstate;
                end  
                else
                begin
                    state <= nextstate;
                end                                     

            end                  
        end   
    end   
 */   
      
            
    always @ (state)
        
    begin    
        case(state)
            
            State_NS_Green: nextstate = State_NS_Yellow;
            State_NS_Yellow: nextstate = State_NS_Red;
            State_NS_Red: nextstate = State_EW_Green;
            State_EW_Green: nextstate = State_EW_Yellow;
            State_EW_Yellow: nextstate = State_EW_Red;
            State_EW_Red: nextstate = State_NS_Green;
        default :nextstate =State_EW_Red;
        endcase
    end
    
    
    always @ (state or count_red or count_yellow or count_green or reset)
    begin
    
        case(state) 
            State_NS_Green: begin NS_Green =1; NS_Yellow =0; NS_Red =0; EW_Green = 0; EW_Yellow =0; EW_Red = 1; end
            State_NS_Yellow: begin NS_Green =0; NS_Yellow =1; NS_Red =0; EW_Green = 0; EW_Yellow =0; EW_Red = 1; end
            State_NS_Red: begin NS_Green =0; NS_Yellow =0; NS_Red =1; EW_Green = 0; EW_Yellow =0; EW_Red = 1; end
            State_EW_Green: begin NS_Green =0; NS_Yellow =0; NS_Red =1; EW_Green = 1; EW_Yellow =0; EW_Red = 0; end
            State_EW_Yellow: begin NS_Green =0; NS_Yellow =0; NS_Red =1; EW_Green = 0; EW_Yellow =1; EW_Red = 0; end
            State_EW_Red: begin NS_Green =0; NS_Yellow =0; NS_Red =1; EW_Green = 0; EW_Yellow =0; EW_Red = 1; end
        default: begin NS_Green =0; NS_Yellow =0; NS_Red =0; EW_Green = 0; EW_Yellow =0; EW_Red = 0; end
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
/*
                case(nextstate)
                State_NS_Yellow:  state <= nextstate;
                State_NS_Red: state <= nextstate;
                State_EW_Yellow: state <= nextstate;
                State_EW_Red: state <= nextstate;
                default :state <= nextstate;
                endcase  
           */
