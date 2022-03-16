`timescale 1ns / 1ps
// Testbench for task 1 of Lab 4

module Lab4_1Test();
    reg R,S;
    wire Q,QBAR;

    Lab4_SR_Latch UUT (.q(Q), .qbar(QBAR), .s(S), .r(R));

    //$monitor("simtime = %g, CLK = %b, S = %b, R = %b, Q = %b, QBAR = %b", $time, CLK, S, R, Q, QBAR);

//    initial begin
//        CLK=0;
//        forever #10 CLK = ~CLK;  
//    end 
    initial begin
        S=0;
        R=0;
        forever#10;
    end
    
    initial begin
        #10 S=1'b1;
        #10 S=1'b0;
        #10 R=1'b1;
        #10 S=1'b1; #10 R=1'b0;
        #10 S=1'b0; #10 R=1'b1;
        #10 S=1'b0; #10 R=1'b0;
        #10 S=1'b0; #10 R=1'b1;
        #10 S=1'b1;
        #20 $finish;
    end
    
    
    
    
    
    initial begin 
        S= 1; R= 0;
        #100; S= 0; R= 1; 
        #100; S= 0; R= 0; 
        #100; S= 1; R=1; 
    end 
endmodule