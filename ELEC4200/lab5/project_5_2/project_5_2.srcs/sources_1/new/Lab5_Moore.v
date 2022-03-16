`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 5
// 
// Create Date: 09/20/2021 03:11:07 PM
// Design Name: 
// Module Name: Lab5_Moore
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


module Lab5_Moore(ain,reset,clock,yout);
    input [1:0] ain;
	input reset, clock;
	output reg yout;

	reg [1:0] state, nextstate;
	parameter s0=2'b00, s1=2'b01, s3=2'b10, s4=2'b11;;

	always @ (posedge clock or posedge reset)
		begin
			if(reset)
			  begin
			  state <= s0;
			  end
			else
			  state <= nextstate;
		end
	always @ (state)
		begin
		  case(state)
		  s0: yout = 0;
		  s1: yout = 1;
		  s3: yout = 0;
		  s4: yout = 1;
		  endcase
		end
	always @ (ain or state)
		begin
		nextstate = s0;
			case(state)
				s0: begin
				    case(ain)
					2'b00: nextstate = s0;
					2'b01: nextstate = s0;
					2'b10: nextstate = s3;
					2'b11: nextstate = s3;
				     endcase
				     end
				 s1: begin
				     case(ain)
				 	2'b00: nextstate = s1;
				 	2'b01: nextstate = s4;
				 	2'b10: nextstate = s4;
				 	2'b11: nextstate = s1;
				     endcase
				     end
				  s3: begin
				    case(ain)
				   	2'b00: nextstate = s1;
				   	2'b01: nextstate = s0;
				   	2'b10: nextstate = s3;
				   	2'b11: nextstate = s3;
				     endcase
				     end
				  s4: begin
				    case(ain)
					2'b00: nextstate = s0;
					2'b01: nextstate = s4;
					2'b10: nextstate = s4;
					2'b11: nextstate = s3;
				     endcase
				     end
				endcase
			end
endmodule

    
//input clock, reset; 
//    input [1:0] ain;
//    output reg yout;
//    reg a=0, counter = 0;
//    reg[2:0] state, nextstate;
//    parameter S_00=0, S_11 = 1, S_10=2, S_01=3, S_wait_01=4, S_wait_11=5, S_wait_10=6;
   
    
    
//    always @ (posedge clock, posedge reset)
//    begin if (reset) state <= S_00; else state <= nextstate; 
//    end
    
//    always @ (*)
//    begin 
//        case(state)
//            S_00:
//                begin 
//                    if (ain == 2'b00) nextstate <=S_00; 
//                    else if (ain == 2'b01) nextstate <= S_wait_01; 
//                    else if (ain == 2'b10) nextstate <= S_wait_10;
//                    else if (ain == 2'b11) nextstate <= S_wait_11;
//                end
//            S_01: 
//                begin 
//                    if (ain == 2'b00) nextstate <=S_01; 
//                    else if (ain == 2'b01) nextstate <= S_wait_01; 
//                    else if (ain == 2'b10) nextstate <= S_wait_10;
//                    else if (ain == 2'b11) nextstate <= S_wait_11;
//                end    
//            S_10: 
//                begin 
//                    if (ain == 2'b00) nextstate <=S_10; 
//                    else if (ain == 2'b01) nextstate <= S_wait_01; 
//                    else if (ain == 2'b10) nextstate <= S_wait_10;
//                    else if (ain == 2'b11) nextstate <= S_wait_11;
//                end    
//            S_11: 
//                begin 
//                    if (ain == 2'b00) nextstate <=S_11; 
//                    else if (ain == 2'b01) nextstate <= S_wait_01; 
//                    else if (ain == 2'b10) nextstate <= S_wait_10;
//                    else if (ain == 2'b11) nextstate <= S_wait_11; 
//                    end
//            S_wait_01: 
//                begin 
//                    if (ain == 2'b00) nextstate <=S_01; 
//                    else if (ain == 2'b01) nextstate <= S_wait_01;
//                    else if (ain == 2'b10) nextstate <= S_wait_10;  
//                    else if (ain == 2'b11) nextstate <= S_wait_11; 
//                    end 
//            S_wait_10: 
//                begin 
//                    if (ain == 2'b00) nextstate <=S_10; 
//                    else if (ain == 2'b01) nextstate <= S_wait_01;
//                    else if (ain == 2'b10) nextstate <= S_wait_10;  
//                    else if (ain == 2'b11) nextstate <= S_wait_11; 
//                    end 
//            S_wait_11: 
//                begin 
//                    if (ain == 2'b00) nextstate <=S_11; 
//                    else if (ain == 2'b01) nextstate <= S_wait_01;
//                    else if (ain == 2'b10) nextstate <= S_wait_10;  
//                    else if (ain == 2'b11) nextstate <= S_wait_11; 
//                    end 
            
//        default :nextstate <= S_00;
//        endcase
//    end
    
//    always @ (state)
 
//    begin
//        case(state)
//            S_00: begin a = 0; yout = a;  end 
//            S_01: begin a= 0; yout = a; end
//            S_10: begin a = ~(a); yout = a; end
//            //S_10: begin if (counter == 0)begin a = ~(a); yout = a; counter = counter +1; end  else begin a = a; yout = a; end end
//            S_11: begin a= 1; yout = a;  end
//            S_wait_01: begin yout = a; end
//            S_wait_10: begin yout = a; end
//            S_wait_11: begin yout = a; end
//        //default: yout = a;  
//        endcase
//    end 

