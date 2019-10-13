`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/05 12:38:09
// Design Name: 
// Module Name: BCD_7_segment_display
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


module BCD_7_segment_display(
    input [3:0] swt,
    output reg [6:0] C,
    output [7:0] AN
    );
    
    //set the first number of the display
    assign AN[0]=0;
    assign AN[1]=1;
    assign AN[2]=1;
    assign AN[3]=1;
    assign AN[4]=1;
    assign AN[5]=1;
    assign AN[6]=1;
    assign AN[7]=1;
    
    //set 7 segment
    always@(swt)
    begin
    case(swt)
    4'b0000:C=7'b0000001;
    4'b0001:C=7'b1001111;
    4'b0010:C=7'b0010010;
    4'b0011:C=7'b0000110;
    4'b0100:C=7'b1001100;
    4'b0101:C=7'b0100100;
    4'b0110:C=7'b0100000;
    4'b0111:C=7'b0001111;
    4'b1000:C=7'b0000000;
    //4'b1001:C=7'b0000100;
    4'b1001:C=7'b0001100;
    //hexadecimal part
    //4'b1010:C=7'b0001000;
    //4'b1011:C=7'b1100000;
    //4'b1100:C=7'b0110001;
    //4'b1101:C=7'b1000010;
    //4'b1110:C=7'b0110000;
    //4'b1111:C=7'b0111000;
    default:C=7'b1111111;
    endcase
    end
    
endmodule
