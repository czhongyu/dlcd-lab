`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/26 22:21:13
// Design Name: 
// Module Name: D_flip_flop
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


module D_flip_flop(
    input clk,
    input d,
    input myset,
    input reset,
    output reg q
    );
    
    wire myclk;
    clkdiv c1(clk, myclk);
    
    always@(posedge myclk,posedge myset,posedge reset)
    begin
        if(myset&~reset)
            q<=1;
        else
            if(reset&~myset)
                q<=0;
            else
                q<=d;
//        case({~myset,~reset})
//        2'b01:q<=0;
//        2'b10:q<=1;
//        default:q<=d;
//        endcase
    end
    
endmodule
