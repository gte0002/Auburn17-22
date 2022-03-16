`timescale 1ns / 1ps

module Lab10_1(multiplier, multiplicand, Clk, load, product, done, state);
    input [2:0] multiplier, multiplicand;
    input  Clk, load;
    output [5:0] product;
    output done;
    output [2:0] state;
    
    wire [5:0] sum; wire [ 4:0] post; wire carry; wire shift; wire add; wire count_done; wire lsb; wire count_up; wire bit_0; wire bit_1; wire bit_2;
    wire [2:0] plier;
    wire [2:0] plier_reg;
    reg [2:0] count;
    reg [6:0] accu;
    
    controller c1(.Clk(Clk), .load(load), .count_done(count_done), .lsb(lsb), .shift(shift), .add(add), .done(done), .bit_0(bit_0), .bit_1(bit_1), .bit_2(bit_2), .state(state));
    data_processor d1(.Clk(Clk), .load(load), .multiplicand(multiplicand),
     .multiplier(multiplier), .shift(shift), .add(add), .done(done), .lsb(lsb), .product(product),
      .count_done(count_done), .bit_0(bit_0), .bit_1(bit_1), .bit_2(bit_2));
   
    
endmodule


module controller(Clk, load, count_done, lsb, shift, add, done,bit_0,bit_1,bit_2,state);
    input lsb, load, count_done, Clk;
    output  shift, add, done, bit_0, bit_1, bit_2;
    reg done, add=0, shift=0, bit_0=0, bit_1=0, bit_2=0;
    //reg [2:0] state=3'b000, nextstate, oldstate=3'b000;
    output reg [2:0] state = 3'b000;
    reg [2:0] nextstate, oldstate=3'b000;
    parameter idle_state = 3'b000, load_state = 3'b001, bit_0_state = 3'b010, bit_1_state = 3'b011, bit_2_state = 3'b100, add_state = 3'b101, shift_state = 3'b110;
    parameter  finished_state = 3'b111;
    always @(posedge Clk)
    begin
    state <= nextstate;
    end
    
    
    always @(state or load or lsb)
    begin
        case(state)
            idle_state: begin
                            if (load==1)
                            begin 
                                nextstate = bit_0_state;
                            end
                            else if(load==0)
                            begin
                                nextstate = idle_state;
                            end
                         end    
            //load_state:  begin nextstate = bit_0_state; end              
            bit_0_state: begin
                            if (lsb==1)
                            begin
                                nextstate = add_state;
                                oldstate = bit_0_state;
                            end
                            else if(lsb==0)
                            begin
                                nextstate = shift_state;
                                oldstate = bit_0_state;
                            end
                         end
            bit_1_state: begin
                            if (lsb==1)
                            begin
                                nextstate = add_state;
                                oldstate = bit_1_state;
                            end
                            else if(lsb==0)
                            begin
                                nextstate = shift_state;
                                oldstate = bit_1_state;
                            end
                         end 
            bit_2_state: begin
                         //nextstate = add_state ;
                         
                            if (lsb==1)
                            begin
                                nextstate = add_state;
                                oldstate = bit_2_state;
                            end
                            else if(lsb==0)
                            begin
                                nextstate = shift_state;
                                oldstate = bit_2_state;
                            end
                            
                         end
            add_state: begin nextstate = shift_state; end   
            shift_state: begin
                            if (oldstate == bit_0_state)
                            begin
                                nextstate = bit_1_state;
                            end
                            else if (oldstate == bit_1_state)
                            begin
                                nextstate = bit_2_state;
                            end
                            else if (oldstate == bit_2_state)
                            begin
                                nextstate = finished_state;
                            end
                         end
            finished_state: begin nextstate = idle_state; end              
           default: nextstate = idle_state; 
        endcase    
    end
    
    always @(state) 
    begin
        case(state)
            idle_state: begin
                            if(load==1)
                            begin
                                done=0; add=0; shift=0; bit_0=0; bit_1=0; bit_2=0;
                            end
                           
                        end
            /* load_state: begin
                            done=0; add=0; shift=0; bit_0=0; bit_1=0; bit_2=0;
                        end
            */            
            bit_0_state: begin
                            done=0; add=0; shift=0;  bit_0=1; bit_1=0; bit_2=0;
                         end
            bit_1_state: begin
                            done=0; add=0; shift=0;  bit_0=0; bit_1=1; bit_2=0; 
                         end
            bit_2_state: begin
                            done=0; add=0; shift=0; bit_0=0; bit_1=0; bit_2=1;
                         end
            add_state:   begin
                            done=0; add=1; shift=0; 
                         end
            shift_state: begin
                            begin done=0; add=0; shift=1;  end 
                         end
            finished_state: begin
                                done =1; add=0; shift=0; bit_0=0; bit_1=0; bit_2=0;
                            end              
            
            default: begin done=0; add=0; shift=0; bit_0=0; bit_1=0; bit_2=0; end
        endcase    
    end


endmodule



module full_adder(input a, input b, input cin, output s, output cout);
    assign s = ( (a^b) ^ cin);
    assign cout = ( ((a^b) & cin) | (a&b) );
endmodule

module add_product(input [2:0] in1, input [2:0] in2, output [2:0]  out_put, output carr_out);
    wire outt1, outt2;
    
    full_adder sum1(.a(in1[0]), .b(in2[0]), .cin(1'b0), .s(out_put[0]), .cout(outt1) );
    full_adder sum2(.a(in1[1]), .b(in2[1]), .cin(outt1), .s(out_put[1]), .cout(outt2) );
    full_adder sum3(.a(in1[2]), .b(in2[2]), .cin(outt2), .s(out_put[2]), .cout(carr_out) );
    
endmodule

module data_processor(Clk,load, multiplicand, multiplier, shift, add, done, lsb, product, count_done, bit_0, bit_1,bit_2);
    input load, Clk, shift, add, done, bit_0,bit_1,bit_2;
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
        
        
        if(load) begin
            sum[6:0] = 7'b0000000;
            //count_done = 0;
            //count[2:0] <= 3'b000; 
            sum[6:3] = 4'b0000;
            //sum[2:0] <= multiplier[2:0];
            //product[5:0] <= 6'b000000;
            //plier[2:0] <= 3'b000;
            plier_reg[2:0] = 4'b0000;
            //plier[2:0] <= multiplier[2:0];
            plier_reg[2:0] = multiplier[2:0];
            lsb = plier_reg[0];
            //lsb <= multiplier[0];
            
        end
        
        
        else if(bit_0==1)
        begin
            //lsb <= plier_reg[0];
            if(add) 
            begin
                sum[6:3] = {cout, mul_reg};
            end 
            
            if (shift) 
            begin
                sum[6:0] = {1'b0, sum[6:1]};
                lsb = plier_reg[1];
            end
        end
        
        else if(bit_1==1)
        begin
        
            if(add) 
            begin
                sum[6:3] = {cout, mul_reg};
            end 
            
            if (shift) 
            begin
                sum[6:0] = {1'b0, sum[6:1]};
                lsb = plier_reg[2];
            end
        end
        
        else if(bit_2==1)
        begin
        
            if(add) 
            begin
                sum[6:3] = {cout, mul_reg};
                //product[5:0] <= sum[5:0]; 
            end 
            
            if (shift) 
            begin
                sum[6:0] = {1'b0, sum[6:1]};
                
                //product[5:0] = sum[5:0];
                //lsb <= plier_reg[1];
            end
        end
        
        if (done) 
        begin
            product[5:0] <= sum[5:0]; 
        end
        product[5:0] = sum[5:0];
    end
    
    
endmodule
