`timescale 1ns / 1ps

module Lab6_7(a, b, cin, s, p, g);
    input a,b,cin;
    output s,p,g;
    wire w1;
    parameter AND_DELAY = 2, OR_DELAY = 2, XOR_DELAY = 2;
    
    xor #(XOR_DELAY) (w1,a,b);
    xor #(XOR_DELAY) (s,w1,cin);
    or #(OR_DELAY) (p,a,b);
    and #(AND_DELAY) (g,a,b);
endmodule


module cla_logic(cin, p, g, cout);
    input cin;
    input [3:0]p,g;
    output [3:0]cout;
    parameter AND_DELAY = 2, OR_DELAY = 2;
    wire [3:0]c;
    
    and #(AND_DELAY) (c[0],p[0],cin);
    or #(OR_DELAY) (cout[0],g[0],c[0]);
    and #(AND_DELAY) (c[1],p[1],c[0]);
    or #(OR_DELAY) (cout[1],g[1],c[1]);
    and #(AND_DELAY) (c[2],p[2],c[1]);
    or #(OR_DELAY) (cout[2],g[2],c[2]);
    and #(AND_DELAY) (c[3],p[3],c[2]);
    or #(OR_DELAY) (cout[3],g[3],c[3]);
endmodule


module Lab6_7_1(a, b, cin, s, cout);
    input [3:0]a, b;
    input cin;
    output [3:0]s;
    output cout;
    wire [3:0]p, g;
    wire [3:0]cla_out;
    
    Lab6_7 FA0(a[0], b[0], cin, s[0], p[0], g[0]);
    Lab6_7 FA1(a[1], b[1], cla_out[0], s[1], p[1], g[1]);
    Lab6_7 FA2(a[2], b[2], cla_out[1], s[2], p[2], g[2]);
    Lab6_7 FA3(a[3], b[3], cla_out[2], s[3], p[3], g[3]);
    cla_logic CLA(cin, p, g, cla_out);
    buf(cout, cla_out[3]);
endmodule
