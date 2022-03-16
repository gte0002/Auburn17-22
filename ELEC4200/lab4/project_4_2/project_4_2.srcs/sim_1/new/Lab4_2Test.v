`timescale 1ns / 1ps
// Testbench for task 2 of Lab 4

module Lab4_2Test();
    reg S,R,CLK;
    wire Q,QBAR;
//2. Instantiate the module we want to test. We have instantiated the srff_behavior

    Lab4_SR_dataflow DUT (.q(Q), .qbar(QBAR), .s(S), .r(R), .clk(CLK));

//3. Monitor TB ports
    //$monitor("simtime = %g, CLK = %b, S = %b, R = %b, Q = %b, QBAR = %b", $time, CLK, S, R, Q, QBAR);

//4. apply test vectors
    initial begin
        CLK=0;
        forever #10 CLK = ~CLK;  
    end 
    initial begin 
        S= 1; R= 0;
        #100; S= 0; R= 1; 
        #100; S= 0; R= 0; 
        #100; S= 1; R=1; 
    end 
endmodule