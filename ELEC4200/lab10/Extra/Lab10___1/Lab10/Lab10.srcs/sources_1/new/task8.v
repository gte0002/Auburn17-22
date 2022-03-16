`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 10:14:08 PM
// Design Name: 
// Module Name: task8
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


module task8(rst,start,X,Y, Z,done );
    input rst, start;
    input [2:0] X,Y;
    output [5:0] Z;
    output done;
    
    reg [5:0] Z;

    wire done;  

    wire P0,P1;// 2 phase clocking

    wire m1,m2,m3,m4;

    // state machine

    reg[2:0] State_machine;

    // Accumulator

    reg [8:0] ACC; // Accumulator

    // logic to create 2 phase clocking when starting

    nand u0(m1,start,m2);

    buf #20 u1(m2,m1);

    buf #10 u2(P0,m1);// First phase clocking

    not #2 u5(m4,P0);

    assign m3=~m1; 

    and #2 u4(P1,m3,m4);// Second phase clocking

    assign done = (State==9)? 1'b1:1'b0; // Finish Flag

    // FSM

    always @(posedge P0 or posedge P1 or posedge rst)

    begin
        if(rst) 
        begin
            State <= 0; 
            ACC <= 0; 
            Z <= 0; 
        end

        else if((P0==1'b1) || (P1==1'b1)) 
        begin // 2 phase clocking
            if(State==0)
            begin
                ACC[5:3] <= 5'b00000; // begin cycle
                ACC[2:0] <= A; // Load ACCUMULATOR
                State <= 1;
            end

            else if(State==1 || State == 3 || State ==5 || State ==7)  // add/shift State
            begin
                if(ACC[0] == 1'b1) 
                begin // add multiplicand
                    ACC[5:3] <= {1'b0,ACC[7:4]} + B; 
                    State <= State + 1;
                end
                else
                begin
                    ACC <= {1'b0,ACC[6:1]};// shift right
                    State <= State + 2;
                end
            end
            else if(State==2 || State == 4 || State ==6 || State ==8)                // shift State
            begin
                ACC <= {1'b0,ACC[6:1]}; // shift right
                State <= State + 1;
            end 
            else if(State == 9) 
            begin
                State <= 0;
                O <= ACC[5:0]; 
            end

        end

    end 

 
endmodule

