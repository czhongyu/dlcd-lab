`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/27 01:47:59
// Design Name: 
// Module Name: Quad_D_flip_flop
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


module Quad_D_flip_flop(
    input clk,
    input [3:0] d,
    input reset,
    output [3:0] q,
    output [3:0] qn
    );
    
    D_flip_flop d0(clk,d[0],0,~reset,q[0]);
    D_flip_flop d1(clk,d[1],0,~reset,q[1]);
    D_flip_flop d2(clk,d[2],0,~reset,q[2]);
    D_flip_flop d3(clk,d[3],0,~reset,q[3]);
    
    assign qn[0]=~q[0];
    assign qn[1]=~q[1];
    assign qn[2]=~q[2];
    assign qn[3]=~q[3];
    
endmodule



