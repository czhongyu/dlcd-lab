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

module decoder_4_16(
    input [3:0] swt,
    input [2:0] g,
    output [15:0] led
    );
    
    decoder_3_8 d1( {swt[3],swt[2:0]}, g[2:0], led[7:0]);
    decoder_3_8 d2( {~swt[3],swt[2:0]}, g[2:0], led[15:8]);

endmodule