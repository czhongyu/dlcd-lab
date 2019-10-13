`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 09:14:53
// Design Name: 
// Module Name: project_2
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

module project_2(
    input [3:0] swt,
    input [2:0] g1,
    input [2:0] g2,
    output [7:0] led1,
    output [7:0] led2
    );
    
    decoder_1 x( swt[0+:4], g1[0+:3], led1[0+:8]);
    decoder_2 y( swt[0+:4], g2[0+:3], led2[0+:8]);

endmodule

module decoder_1(
    input [3:0] swt,
    input [2:0] g,
    output [7:0] led
    );
    
    //use De Morgan's Law
    assign led[0]=swt[0] | swt[1] | swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    assign led[1]=~swt[0] | swt[1] | swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    assign led[2]=swt[0] | ~swt[1] | swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    assign led[3]=~swt[0] | ~swt[1] | swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    assign led[4]=swt[0] | swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    assign led[5]=~swt[0] | swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    assign led[6]=swt[0] | ~swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    assign led[7]=~swt[0] | ~swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| swt[3];
    
endmodule

module decoder_2(
    input [3:0] swt,
    input [2:0] g,
    output [7:0] led
    );
    
    //use De Morgan's Law
    assign led[0]=swt[0] | swt[1] | swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    assign led[1]=~swt[0] | swt[1] | swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    assign led[2]=swt[0] | ~swt[1] | swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    assign led[3]=~swt[0] | ~swt[1] | swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    assign led[4]=swt[0] | swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    assign led[5]=~swt[0] | swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    assign led[6]=swt[0] | ~swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    assign led[7]=~swt[0] | ~swt[1] | ~swt[2]| ~g[0] | g[1] | g[2]| ~swt[3];
    
endmodule