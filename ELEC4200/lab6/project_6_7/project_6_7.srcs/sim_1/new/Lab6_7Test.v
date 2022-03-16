`timescale 1ns / 1ps

module Lab6_7Test();
    reg [3:0]a_in;
    reg [3:0]b_in;
    reg cin;
    wire [3:0]s_out;
    wire cout;
    integer i,k;
    
    defparam DUT.FA0.AND_DELAY=3, DUT.FA0.OR_DELAY=3, DUT.FA0.XOR_DELAY=4;
    defparam DUT.FA1.AND_DELAY=3, DUT.FA1.OR_DELAY=3, DUT.FA1.XOR_DELAY=4;
    defparam DUT.FA2.AND_DELAY=3, DUT.FA2.OR_DELAY=3, DUT.FA2.XOR_DELAY=4;
    defparam DUT.FA3.AND_DELAY=3, DUT.FA3.OR_DELAY=3, DUT.FA3.XOR_DELAY=4;
    defparam DUT.CLA.AND_DELAY=3, DUT.CLA.OR_DELAY=3;
    
    Lab6_7_1 DUT(.a(a_in), .b(b_in), .cin(cin), .s(s_out), .cout(cout));
    
    initial
    begin
        cin = 0;
        a_in = 0;
        b_in = 0;
        for(i = 0; i < 2; i=i+1)
        begin
            if(i == 1)
            cin = 1;
            for(k = 0; k < 15; k=k+1)
            begin
                #10 a_in = k; b_in = k+1;
            end
        end
    end
endmodule
