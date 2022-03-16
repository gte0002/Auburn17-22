`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 10:45:26 PM
// Design Name: 
// Module Name: multiplier_4x4
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


module multiplier_4x4(Ready, Mcand, Mplier, Start, clock, segments, AN, reset_b);
    parameter dp_width = 4; // Set to width of datapath
    wire [7:0] Product;
    output reg Ready; //also done
    output [6:0] segments;
    output [7:0] AN;
    wire DCM_lock;
    reg [3:0] ones, tens, hundreds;
    input [3:0] Mcand, Mplier;
    input Start, clock, reset_b;
    
    //parameter BC_size= 3; // Size of bit counter
    parameter S_idle= 3'b001, // one-hot code
              S_add= 3'b010,
              S_shift= 3'b100;
    reg [2:0] state, next_state;
    reg [3:0] A, B, Q; // Sized for datapath
    reg C;
    reg [1:0] P;
    reg Load_regs, Decr_P, Add_regs, Shift_regs;
    
    // Miscellaneous combinational logic
    assign Product = {A, Q};
    wire Zero = (P == 0); // counter is zero // Zero = ~|P; // alternative
    //wire Ready = (state == S_idle); // controller status 
    
    integer counter = 0;
    
//    reg [3:0] ROM [31:0];
//    wire [3:0] Multiplicand, Multiplier;
    
//    assign Multiplicand = MY_ROM[Mcand];
//    assign Multiplier = MY_ROM[Mplier+16];
//    initial $readmemb ("mcandsandmpliers.mem", MY_ROM, 0, 31);
    
    wire [3:0] multiplicand; 
    wire [3:0] multiplier;
    reg [3:0] ROM [31:0];
    assign multiplicand = ROM[Mcand];
    assign multiplier = ROM[Mplier + 16];
    initial $readmemb ("memory.mem", ROM, 0, 31);
    
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
            default : next_state = S_idle;
        endcase
    end
    
    //Datapath Unit
    always @(posedge clock) begin //outputs
         if (Load_regs) begin
            P <= 4; //P=dp_width;
            A <= 0;        //accumulator
            C <= 0;
            B <= multiplicand;
            Q <= multiplier;
         end
         if (P == 0) Ready <= 1;
         if (P > 0) Ready <= 0;
         if (Add_regs) {C,A} <= A+B; 
         if (Shift_regs) {C,A,Q} <= {C,A,Q} >> 1;
         if (Decr_P) P <= P-1;
    end
    
    //convert product bits to bcd
    //reg [3:0] ones;
    //reg [3:0] tens;
    //reg [3:0] hundreds;
    always @ (Product)
    begin
        ones = Product % 10;
        tens = (Product / 10) % 10;
        hundreds = Product / 100;
    end
    
    
    //7 segment display
    wire clk_src_5MHz;
    wire clk_src_500Hz;
    wire lock_signal;
    reg pulse_at_500Hz;
    
    //Error with both clk_src_5Mhz and 500Hz
    clk_wiz_0 clk_5MHz(.clk_in1(clock), .clk_out1(clk_src_5MHz), .locked(DCM_lock)); 
    
    clock_divider divider(.clock_in(clk_src_5MHz), .clock_out(clk_src_500Hz));
    
    initial begin
        pulse_at_500Hz = 0;
    end
    
    always @(posedge clk_src_500Hz)
        begin
            pulse_at_500Hz = ~pulse_at_500Hz;
        end
        
        //Display on 7 segment display
    bcd_to_7_seg seg1(.clk_in(clk_src_500Hz), .ones(ones), .segments(segments), .AN(AN), .tens(tens), .hundreds(hundreds));
    
//    bcd_converter_7_seg seg7(.tens(tens), .ones(ones), .hundreds(hundreds), .v(Product), .segments(segments), .AN(AN),
//            .reset(reset_b), .clk_in(clock), .DCM_lock(DCM_lock));
    
endmodule
