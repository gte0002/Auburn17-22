`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 06:20:57 PM
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


module task1(clock, reset, ain, yout, count);
    input clock, reset, ain;
    output reg [3:0] count;
    output reg yout;
    reg[1:0] state, nextstate;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    
    always @ (posedge clock or posedge reset)
    begin if (reset) state <= S0; else state <= nextstate; 
    end

  
    always @ (state or ain)
       
    begin
        //if (ain) 
        count = count + 1;
        case(state)
            
            S0: begin if (ain) nextstate =S1;  else nextstate = S0; end
            S1: begin if (ain) nextstate =S2; else nextstate = S1; end
            S2: begin if (ain) nextstate =S3; else nextstate = S2; end 
            S3: begin if (ain) nextstate =S1; else nextstate = S3; end
        default :nextstate = S0;
        endcase
    end
    
    
    always @ (state or ain or reset)
    begin
    
        case(state)
            //S0: begin if (ain) yout <= 1'b0; else if (~reset) yout <= 1'b1; else if (~ain) yout <= 1'b1; end 
            S0: begin if (ain) yout <= 1'b0; else if (~ain) yout <= 1'b1; end 
            S1: begin yout <= 1'b0; end
            S2 : begin yout <= 1'b0; end
            S3: begin if (ain) yout <= 1'b1; else yout <= 1'b0; end
        default: yout <= 1'b0; 
        endcase
    end 
        
                   
    
endmodule
