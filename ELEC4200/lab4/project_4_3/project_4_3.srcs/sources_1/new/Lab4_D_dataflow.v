`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Gabriel Emerson
// Class: ELEC 4200
// Assignment: Lab 4
// 
// Create Date: 09/15/2021 05:26:14 PM
// Design Name: 
// Module Name: Lab4_D_dataflow
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
///////////////////////////////////////////////////////////////


module Lab4_D_dataflow(Q,D,Enable,Qbar);
    input D,Enable;
    output Q,Qbar;

    assign #2 Dbar = ~D;
    assign #2 A_i = (Dbar & Enable);
    assign #2 B_i = (D & Enable);
    assign #2 Q_i = Q;
    assign #2 Qbar_i = Qbar;
    //outputs
    assign #2 Q = ~ (A_i | Qbar);
    assign #2 Qbar = ~ (B_i | Q);
endmodule
