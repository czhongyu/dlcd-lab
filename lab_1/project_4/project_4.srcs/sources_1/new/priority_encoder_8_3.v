`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 10:50:59
// Design Name: 
// Module Name: project_4
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


module priority_encoder_8_3(
    input [7:0] swt,
    output reg [2:0] led
    );
    
    always@(swt)
    begin
    if(swt[7])
    led=3'b111;
    else if(swt[6])
    led=3'b110;
    else if(swt[5])
    led=3'b101;
    else if(swt[4])
    led=3'b100;
    else if(swt[3])
    led=3'b011;
    else if(swt[2])
    led=3'b010;
    else if(swt[1])
    led=3'b001;
    else if(swt[0])
    led=3'b000;
    else
    led=3'b000;
    end
    
endmodule
