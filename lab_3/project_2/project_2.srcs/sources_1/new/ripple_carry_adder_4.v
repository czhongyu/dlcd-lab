`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 12:00:34
// Design Name: 
// Module Name: ripple_carry_adder_4
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


module ripple_carry_adder_4(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    
    wire [4:0] c;
    //always@(a[0],a[1],a[2],a[3],b[0],b[1],b[2],b[3],cin)
    //always@(posedge clk)
    //begin
    assign c[0]=cin;
    full_adder_1 bit0(a[0+:1],b[0+:1],c[0+:1],s[0+:1],c[1+:1]);
    full_adder_1 bit1(a[1+:1],b[1+:1],c[1+:1],s[1+:1],c[2+:1]);
    full_adder_1 bit2(a[2+:1],b[2+:1],c[2+:1],s[2+:1],c[3+:1]);
    full_adder_1 bit3(a[3+:1],b[3+:1],c[3+:1],s[3+:1],c[4+:1]);
    //end
    
    assign cout=c[4];
endmodule
