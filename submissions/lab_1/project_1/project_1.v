`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 08:30:50
// Design Name: 
// Module Name: project_1
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


module project_1(
    input [2:0] swt,
    input [2:0] g,
    output [7:0] led
    );
    
    //use De Morgan's Law
    assign led[0]=swt[0] | swt[1] | swt[2]| ~g[0] | g[1] | g[2];
    assign led[1]=~swt[0] | swt[1] | swt[2]| ~g[0] | g[1] | g[2];
    assign led[2]=swt[0] | ~swt[1] | swt[2]| ~g[0] | g[1] | g[2];
    assign led[3]=~swt[0] | ~swt[1] | swt[2]| ~g[0] | g[1] | g[2];
    assign led[4]=swt[0] | swt[1] | ~swt[2]| ~g[0] | g[1] | g[2];
    assign led[5]=~swt[0] | swt[1] | ~swt[2]| ~g[0] | g[1] | g[2];
    assign led[6]=swt[0] | ~swt[1] | ~swt[2]| ~g[0] | g[1] | g[2];
    assign led[7]=~swt[0] | ~swt[1] | ~swt[2]| ~g[0] | g[1] | g[2];
    
endmodule
