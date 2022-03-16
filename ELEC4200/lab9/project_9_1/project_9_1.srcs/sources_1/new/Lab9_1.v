`timescale 1ns / 1ps

module Lab9_1(enable,out);
    input enable;
    output out;
    (* ALLOW_COMBINATIONAL_LOOPS = "TRUE" *)
    (* DONT_TOUCH = "TRUE" *) wire w1, w2, w3, w4, w5, w6;
    
    and #5(w1, enable, out );   
    not #5(w2, w1);
    not #5(w3, w2);
    not #5(w4, w3);
    not #5(w5, w4);
    not #5(w6,w5);
    assign out = w6;
endmodule
