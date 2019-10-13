`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/27 00:20:44
// Design Name: 
// Module Name: T_flip_flop
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


module T_flip_flop(
    input clk,
    input t,
    input myset,
    input reset,
    output reg q
    );
    
    wire myclk;
    clkdiv c1(clk, myclk);
    always@(posedge myclk,posedge myset,posedge reset)
    begin
        if(reset&~myset)
            q<=0;
        else
            if(myset&~reset)
                q<=1;
            else
                if(t)
                    q<=~q;
                else
                    q<=q;
//        if(~t)
//            q<=q;
//        else
//            q<=~q;
    end
    
endmodule
