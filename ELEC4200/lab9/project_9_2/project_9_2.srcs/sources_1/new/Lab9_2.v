`timescale 1ns / 1ps

module Lab9_2(enable,out);
    input enable;
    output out;
    (* ALLOW_COMBINATIONAL_LOOPS = "TRUE" *)
    (* DONT_TOUCH = "TRUE" *) wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
    
    assign out = w10;
    and #5(w1, enable,out );   
    not #5(w2, w1);
    not #5(w3, w2);
    not #5(w4, w3);
    not #5(w5, w4);
    not #5(w6,w5);
    not #5(w7,w6);
    not #5(w8,w7);
    not #5(w9,w8);
    not #5(w10,w9);
endmodule
