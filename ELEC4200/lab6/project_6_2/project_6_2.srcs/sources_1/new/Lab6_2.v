`timescale 1ns / 1ps

module Lab6_2(bcd,enin,enout,out);
	input enin;
	input [3:0] bcd;
	output reg enout;
	output reg [3:0] out;

	always @ (enin or bcd)
		if (enin == 1'b1)
		    begin
		    enout = 1'b0;
			case(bcd)
			    4'b0000: out = 4'b0000; //00
			    4'b0001: out = 4'b0001; //01
			    4'b0010: out = 4'b0011; //02
			    4'b0011: out = 4'b0010; //03
			    4'b0100: out = 4'b0110; //04
			    4'b0101: out = 4'b0111; //05
			    4'b0110: out = 4'b0101; //06
			    4'b0111: out = 4'b0100; //07
			    4'b1000: out = 4'b1100; //08
			    4'b1001: out = 4'b1101; //09
			    default: begin
				     out = 4'b1111;
				     enout = 1'b1;
				     end
			endcase
		end
		else
	   	     begin out = 4'b1111; enout = 1'b1;
        end
endmodule
