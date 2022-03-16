`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 10:26:21 PM
// Design Name: 
// Module Name: task8sim
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


module task8wim(); // signals
    reg start,rst; reg[3:0] X,Y;
    // Outputs
    wire [5:0] Z;
    wire done;
    // dut
    task8 dut(rst,start, X,Y,Z,done);
    initial begin rst=1; // reset
    #20 start = 0;A =6; B= 7;
    #500 rst = 0;
    #20 start = 1;
    // start
    //@(posedge Finish);
    //start = 0; //$done;
    end
endmodule

