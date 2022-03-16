`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 06:42:12 PM
// Design Name: 
// Module Name: task7
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


module task7(multiplier, multiplicand, Clk, load, product, done);
    input [2:0] multiplier, multiplicand;
    input  Clk, load;
    output [5:0] product;
    output done;
    wire [5:0] sum; wire [ 4:0] post; wire carry; wire shift; wire add; wire count_done; wire lsb; wire count_up;
    wire [2:0] plier;
    wire [2:0] plier_reg;
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
    reg done=0, add=0, shift=0, count_up=0;
    reg [2:0] state=3'b000, nextstate;
    parameter idle_state = 3'b000, check_lsb_state = 3'b001, add_shift = 3'b010, finished_state = 3'b011;

    always @(posedge Clk)
    begin
    //if(count_done) begin done <= 1; end
    state <= nextstate;
    end
    
    always @(state or load or lsb or count_done) begin
        case(state)
            idle_state: begin if (load) begin nextstate = check_lsb_state; end
                  else if(!load) nextstate = idle_state; end
            check_lsb_state: begin 
                            if(lsb)  
                            begin nextstate = add_shift;   end 
                            if(!lsb) 
                            begin
                                begin if(count_done) nextstate = finished_state; if(!count_done) nextstate = check_lsb_state; end  
                            end 
                            end     
            add_shift: begin if(count_done) nextstate = finished_state; if(!count_done) nextstate = check_lsb_state; end
            //shift_state: begin if(count_done==1) nextstate = finished_state; else if(count_done==0) nextstate = check_lsb_state; end
            finished_state: nextstate = idle_state;
            default: nextstate = idle_state;
        endcase    
    end
    
    always @(state )begin
        case(state) 
            idle_state: begin if(load) begin  done = 0; end  end
            check_lsb_state: begin 
                             if (lsb) begin add = 1; shift = 0; done = 0; count_up = 0; end 
                             if (!lsb) begin add = 0; shift = 1; done = 0; count_up = 1; end
                             if(count_done) done = 1; 
                             end
                              
                       
            add_shift: begin if (count_done) begin done = 1; end if(lsb)  begin shift = 1; add = 1; count_up = 1; done = 0; end   end      
            //shift_state: begin add = 0; shift = 1; done=0; count_up = 1; end
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
   
    reg [6:0] sum;
    reg [2:0] plier;
    reg [2:0] plier_reg;
    wire cout;
    wire [2:0] mul_reg;
    reg [2:0] count = 0;
    
    
    add_product add1(.in1(sum[5:3]) , .in2(multiplicand) , .out_put(mul_reg), .carr_out(cout));
    
    
    
    always @(posedge Clk)
    begin
        
        
        //lsb <= plier_reg[0];
        
        if(count_up) begin 
            count <= count + 1;
            if (count ==3) begin count_done = 1;   end  
        end
        
        if(load) begin
            sum[6:0] <= 7'b0000000;
            count_done = 0;
            count[2:0] <= 3'b000; 
            sum[6:3] <= 4'b0000;
            //sum[2:0] <= multiplier[2:0];
            product[5:0] = 6'b000000;
            //plier[2:0] <= 3'b000;
            plier_reg[2:0] <= 4'b0000;
            //plier[2:0] <= multiplier[2:0];
            plier_reg[2:0] <= multiplier[2:0];
            lsb <= plier_reg[0];
            //lsb <= multiplier[0];
            
        end
        
        
        
        
        
        if(add) begin
            sum[6:3] = {cout, mul_reg};   
        end
        
        if (shift) begin
            sum[6:0] = {1'b0, sum[6:1]};
            //plier[2:0] <= {1'b0, sum[2:1]};
            plier_reg[2:0] <= {1'b0, plier_reg[2:1]};
            
                
        end
        
        
        //lsb <= sum[0];
        //product[5:0] = sum[5:0];
        if (done) begin
            product[5:0] = sum[5:0]; 
        end
        product[5:0] = sum[5:0];
        lsb <= plier_reg[0];
        
        
        
        
    
    
    
    end
    
    
endmodule