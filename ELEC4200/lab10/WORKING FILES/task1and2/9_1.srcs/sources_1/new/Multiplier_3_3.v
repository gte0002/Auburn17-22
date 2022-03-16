`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 07:29:20 PM
// Design Name: 
// Module Name: Multiplier_3_3
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


module Multiplier_3_3(Product, done, Multiplicand, Multiplier, Start, clock, reset_b);// Default configuration: five-bit datapath
    //parameter dp_width = 3; // Set to width of datapath
    output [5:0] Product;
    //output reg Ready;
    output reg done;
    input [2: 0] Multiplicand, Multiplier;
    input Start, clock, reset_b;
    
    //parameter BC_size= 3; // Size of bit counter
    parameter S_idle= 3'b001, // one-hot code
              S_add= 3'b010,
              S_shift= 3'b100;
    reg [2:0] state, next_state;
    reg [2:0] A, B, Q; // Sized for datapath
    reg C;
    reg [1:0] P;
    reg Load_regs, Decr_P, Add_regs, Shift_regs;
    // Miscellaneous combinational logic
    assign Product = {A, Q};
    wire Zero = (P == 0); // counter is zero // Zero = ~|P; // alternative
    //wire Ready = (state == S_idle); // controller status 
    
    // control unit
    always @ (posedge clock, negedge reset_b) begin//next state assignment
        if (~reset_b) state <= S_idle; 
        else state <= next_state;
    end
    
    always @(state, Start, Q[0], Zero) begin//next state logic
        Decr_P = 0;  //acc[3] will be carry bit
        Load_regs = 0;
        Add_regs=0;
        Shift_regs=0;
        next_state = S_idle; //default case
        
        case(state)
            S_idle : begin if(Start) begin next_state = S_add;
                                     Load_regs = 1; end end
            S_add : begin next_state = S_shift; Decr_P=1;
                            if (Q[0]) Add_regs=1; end
            S_shift : begin Shift_regs=1; 
                            if(Zero) next_state = S_idle;
                            else next_state = S_add; end
        endcase
    end
    
    //Datapath Unit
    always @(posedge clock) begin //outputs
         if (Load_regs) begin
            P <= 3;
            A <= 0; //accumulator
            C <= 0;
            B <= Multiplicand;
            Q <= Multiplier;
         end
         if (P == 0) done <= 1;
         if (P > 0) done <= 0;
         if (Add_regs) {C,A} <= A+B; 
         if (Shift_regs) {C,A,Q} <= {C,A,Q} >> 1;
         if (Decr_P) P <= P-1;
    end
endmodule
