`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 08:17:07
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
    input [7:0] swt,
    output [7:0] led
    );
    
    assign led[0]=swt[0];
    assign led[1]=swt[1];
    assign led[2]=swt[2];
    assign led[3]=swt[3];
    assign led[4]=swt[4];
    assign led[5]=swt[5];
    assign led[6]=swt[6];
    assign led[7]=swt[7];
    
endmodule
