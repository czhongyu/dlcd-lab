`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/26 23:51:47
// Design Name: 
// Module Name: JK_flip_flop
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


module JK_flip_flop(
    input clk,
    input myset,
    input reset,
    input j,
    input k,
    output reg q
    );
    wire myclk;
    clkdiv c1(clk, myclk);
    always@(posedge myclk, posedge myset, posedge reset)
    begin
        if(reset&~myset)
            q<=0;
        else
            if(myset&~reset)
                q<=1;
            else
        
        if(j&~k)
            q<=1;
        else
            if(k&~j)
                q<=0;
            else
                if(k&j)
                    q<=~q;
                else
                    q<=q;
    end
    
endmodule
