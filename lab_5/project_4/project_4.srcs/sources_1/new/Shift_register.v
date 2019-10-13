`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/27 09:48:40
// Design Name: 
// Module Name: Shift_register
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


module Shift_register(
    input clk,
    input reset,
    input [1:0] d,
    input [1:0] a,
    input [3:0] data,
    output reg [3:0] q
    );
    wire myclk;
    clkdiv c1(clk,myclk);
    always@(posedge myclk,posedge reset)
    begin
        if(~reset)
            q[3:0]=4'b0000;
        else
            case(a)
            2'b00:q[3:0]=q[3:0];
            2'b01:q[3:0]={d[1],q[3:1]};
            2'b10:q[3:0]={q[2:0],d[0]};
            2'b11:q[3:0]=data[3:0];
            endcase
    end
    
endmodule
