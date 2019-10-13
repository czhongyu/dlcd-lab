`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 10:28:54
// Design Name: 
// Module Name: project_3
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


module encoder_8_3(
    input [7:0] swt,
    output [2:0] led
    );
    
    assign led[0]=swt[4]|swt[5]|swt[6]|swt[7];
    assign led[1]=swt[2]|swt[3]|swt[6]|swt[7];
    assign led[2]=swt[1]|swt[3]|swt[5]|swt[7];
    
endmodule
