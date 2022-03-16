`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2021 09:01:18 PM
// Design Name: 
// Module Name: task4
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


module task4(multiplier, multiplicand, Clk, start, product, done);
    input [2:0] multiplier, multiplicand;
    input  Clk, start;
    output [5:0] product;
    output done;
    wire [5:0] sum; wire [ 4:0] post; wire carry; wire shift; wire add; wire count_done; wire lsb; wire count_up;
    reg [2:0] count;
    reg [6:0] accu;
    
    controller c1(.Clk(Clk), .start_in(start), .count_done(count_done), .lsb(lsb), .count_up(count_up), 
    .shift(shift), .add(add), .done(done));
    data_processor d1(.Clk(Clk), .start(start), .multiplicand(multiplicand),
     .multiplier(multiplier), .shift(shift), .add(add), .count_up(count_up), .done(done), .lsb(lsb), .product(product),
      .count_done(count_done));
   
    
endmodule


module controller(Clk, start_in, count_done, lsb, count_up, shift, add, done);
    input lsb, start_in, count_done, Clk;
    output count_up, shift, add, done;
    reg done, add, shift, count_up;
    reg [1:0] state=0, nextstate;
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

    always @(posedge Clk)
    begin
    state <= nextstate;
    end
    
    always @(state or start_in or count_done or lsb) begin
        case(state)
            S0: if (start_in) begin nextstate = S1; end
                else nextstate = S0;
            S1: nextstate = S2; 
            S2: if(count_done) begin nextstate = S3; end
                else nextstate = S1;
            S3: nextstate = S0;
            default: nextstate = S0;
        endcase    
    end
    
    always @(state)begin
        case(state)
            //S0: begin if(start_in==1) begin add = 0; shift = 0; done = 0; count_up = 0; end else if(start_in==0)  begin add = 0; shift = 0; done = 1; count_up = 0; end end
            S1: begin if(lsb)begin add = 1; end else begin shift =0; count_up =0; done =0; end end
            S2: begin add = 0; shift = 1; count_up = 1; done =0;  end
            S3: begin done = 1; add = 0; shift = 0; count_up =0; end
            default: begin add = 0; shift = 0; done = 0; count_up = 0; end
        endcase    
    end


endmodule
/*
module shift_task();
    input Clk;
    input ShiftIn; 
    input [5:0] ParallelIn;
    output [5:0] RegContent;
    reg [3:0] shift_reg;
    task shift;
    begin
    
    assign shift_reg = ParallelIn;
    assign shift_reg = {ShiftIn,shift_reg[5:1]};      
    assign RegContent = shift_reg;
     
    end  
    endtask   
endmodule
*/


module full_adder(input a, input b, input cin, output s, output cout);
    assign s = (a^b)^cin;
    assign cout = (a&b) | ((a^b) & cin);
endmodule
module add_product(input [2:0] a, input [2:0] b, output [2:0]  s, output cout);
    wire out1, out2;
    full_adder sum1(.a(a[0]), .b(b[0]), .cin(1'b0), .s(s[0]), .cout(out1) );
    full_adder sum2(.a(a[1]), .b(b[1]), .cin(out1), .s(s[1]), .cout(out2) );
    full_adder sum3(.a(a[2]), .b(b[2]), .cin(out2), .s(s[2]), .cout(cout) );
endmodule

module data_processor(Clk,start, multiplicand, multiplier, shift, add, count_up, done, lsb, product, count_done);
    input start, Clk, shift, add, count_up, done;
    input [2:0] multiplicand;
    input [2:0] multiplier;
    output reg lsb;
    output reg count_done = 0;
    output reg [5:0] product;
    reg [3:0] count =0;
    reg [6:0] accu;
    wire cout;
    wire [2:0] mul_reg;
    
    add_product add1(.a(accu[5:3]) , .b(multiplier) , .s(mul_reg), .cout(cout));
    
    always @(posedge Clk)
    begin
        
        
        
        
        if(start) begin
            accu <= 7'b0000000;
            count_done <= 0;
            count <= 3'b000;
            accu[6:3] <= 4'b0000;
            accu[2:0] <= multiplicand[2:0];
            lsb <= multiplicand[0];
        end
        if(count_up) begin
            count <= count + 1;
            
            if (count == 3) begin count_done <= 1; end else count <= 0;
        end
        if (add) begin
            accu[6:3] <= {cout, mul_reg};
        end
        if (shift) begin
            accu <= {1'b0, accu[6:1]};         
        end
        /*
        else if (count_up | shift) begin
            count <= count + 1;
            accu <= {1'b0, accu[6:1]};
            if (count == 3) begin count_done <= 1; end
        end
        */
        
        if (done) begin
            product <= accu[5:0];
        end
        
        product <= accu[5:0];
        lsb <= accu[0];
        
    end


endmodule
