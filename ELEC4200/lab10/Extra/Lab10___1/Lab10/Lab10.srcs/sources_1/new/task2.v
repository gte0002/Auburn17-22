`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 07:59:23 PM
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



module task2(multiplier, multiplicand, Clk, load, product, done);
    input [2:0] multiplier, multiplicand;
    input  Clk, load;
    output [5:0] product;
    output done;
    wire [5:0] sum; wire [ 4:0] post; wire carry; wire shift; wire add; wire count_done; wire lsb; wire count_up;
    reg [2:0] count;
    reg [6:0] accu;
    
    controller c1(.Clk(Clk), .load(load), .count_done(count_done), .lsb(lsb), .shift(shift), .add(add), .done(done), .count_up(count_up));
    data_processor d1(.Clk(Clk), .load(load), .multiplicand(multiplicand),
     .multiplier(multiplier), .shift(shift), .add(add), .done(done), .lsb(lsb), .product(product),
      .count_done(count_done), .count_up(count_up));
   
    
endmodule


module controller(Clk, load, count_done, lsb, shift, add, done,count_up);
    input lsb, load, count_done, Clk;
    output  shift, add, done, count_up;
    reg done, add, shift, count_up;
    reg [1:0] state=0, nextstate;
    parameter idle_state = 0, check_lsb_state = 1, add_state = 2, shift_state = 3, finished_state = 4;

    always @(posedge Clk)
    begin
    state <= nextstate;
    end
    
    always @(state or load or lsb or count_done) begin
        case(state)
            idle_state: if (load==1) begin nextstate = check_lsb_state; end
                  else if(load == 0) nextstate = idle_state;
            check_lsb_state: begin 
                            if(lsb==1)  
                            begin nextstate = add_state;   end 
                            else if(lsb==0) begin nextstate = shift_state;   end   
                            end      
            add_state: begin nextstate = shift_state;   end 
            shift_state: begin if(count_done==1) nextstate = finished_state; else if(count_done==0) nextstate = check_lsb_state; end
            finished_state: nextstate = idle_state;
            default: nextstate = idle_state;
        endcase    
    end
    
    always @(state)begin
        case(state) 
            idle_state: begin if(load==1) begin add = 0; shift = 0; done = 0; count_up = 0; end else if(load==0) done =1; end
            check_lsb_state: begin add = 0; shift = 0; done = 0; count_up = 0; end
                       
            add_state: begin shift = 0; done =0; add = 1; count_up = 0; end          
            shift_state: begin add = 0; shift = 1; done=0; count_up = 1; end
            finished_state: begin  done = 1; add = 0; shift = 0; count_up = 0; end
            default: begin add = 0; shift = 0; done = 0; count_up = 0; end
        endcase    
    end


endmodule



module full_adder(input a, input b, input cin, output s, output cout);
    /*
    wire w1, w2, w3;
    assign w1 = a ^ b;
    assign w2 = w1 & cin;
    assign w3 = a & b;
    assign s  = w1 ^ cin;
    assign cout = w2 | w3;
    */
    assign s = ( (a^b) ^ cin);
    assign cout = ( ((a^b) & cin) | (a&b) );
    //assign cout = (a&b) | ((a^b) & cin);
    //assign cout = (a&b) | (b^cin) | (cin^a) ;
endmodule
module add_product(input [2:0] in1, input [2:0] in2, output [2:0]  out_put, output carr_out);
    wire outt1, outt2;
    
    full_adder sum1(.a(in1[0]), .b(in2[0]), .cin(1'b0), .s(out_put[0]), .cout(outt1) );
    full_adder sum2(.a(in1[1]), .b(in2[1]), .cin(outt1), .s(out_put[1]), .cout(outt2) );
    full_adder sum3(.a(in1[2]), .b(in2[2]), .cin(outt2), .s(out_put[2]), .cout(carr_out) );
    
endmodule

module data_processor(Clk,load, multiplicand, multiplier, shift, add, done, lsb, product, count_done, count_up);
    input load, Clk, shift, add, done, count_up;
    input [2:0] multiplicand;
    input [2:0] multiplier;
    output reg lsb;
    output reg count_done=0;
    output reg [5:0] product;
    reg [2:0] count=0;
    reg [6:0] sum;
    wire cout;
    wire [2:0] mul_reg;
    
    
    
    add_product add1(.in1(sum[5:3]) , .in2(multiplicand) , .out_put(mul_reg), .carr_out(cout));
    
    always @(posedge Clk)
    begin
        
        if(count_up==1) begin 
            count <= count + 1;
            begin if (count <2)begin count_done <= 1; end else count_done <=0;  end
        end
        if(load==1) begin
            sum[6:0] <= 7'b0000000;
            count_done <= 0;
            count <= 3'b000;
            sum[6:3] <= 4'b0000;
            sum[2:0] <= multiplier[2:0];
            lsb <= sum[0];
            product <= 6'b000000;
        end
        
        if(add==1) begin
            sum[6:3] <= {cout, mul_reg};   
        end
        
        if (shift==1) begin 
            sum[6:0] <= {1'b0, sum[6:1]};
           
                 
        end
        
        if (done==1) begin
            product[5:0] <= sum[5:0];
            sum[6:0] <= 7'b0000000;
        end
        
        
        product[5:0] <= sum[5:0];
        lsb <= sum[0];
        
        
        
    
    
    
    end
    
    
endmodule











/*
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
       
        if(count_up) begin
            count <= count + 1;
            
            if (count ==3)begin count_done <= 1; end
        end
        
        
        if(start) begin
            accu <= 7'b0000000;
            count_done <= 0;
            //unt <= 3'b000;
            accu[6:3] <= 4'b0000;
            accu[2:0] <= multiplicand[2:0];
            lsb <= multiplicand[0];
        end
        else if (add) begin
            accu[6:3] <= {cout, mul_reg};
        end
        else if (shift) begin
            accu <= {1'b0, accu[6:1]};         
        end
        
        else if (count_up | shift) begin
            count <= count + 1;
            accu <= {1'b0, accu[6:1]};
            if (count == 3) begin count_done <= 1; end
        end
        
        
        else if (done) begin
            product <= accu[5:0];
        end
        
        
        product = accu[5:0];
        lsb <=accu[0];
        
    end
*/