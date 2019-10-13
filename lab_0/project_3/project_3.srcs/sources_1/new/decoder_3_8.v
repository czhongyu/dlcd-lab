`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 10:01:43
// Design Name: 
// Module Name: 3_8_decoder
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


module decoder_3_8(
    input [2:0] swt,
    output [7:0] led
    );
    
    assign led[0]=~swt[0] & ~swt[1] & ~swt[2];
    assign led[1]=swt[0] & ~swt[1] & ~swt[2];
    assign led[2]=~swt[0] & swt[1] & ~swt[2];
    assign led[3]=swt[0] & swt[1] & ~swt[2];
    assign led[4]=~swt[0] & ~swt[1] & swt[2];
    assign led[5]=swt[0] & ~swt[1] & swt[2];
    assign led[6]=~swt[0] & swt[1] & swt[2];
    assign led[7]=swt[0] & swt[1] & swt[2];
    
endmodule
