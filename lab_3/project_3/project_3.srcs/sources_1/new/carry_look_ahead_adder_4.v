`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 14:12:27
// Design Name: 
// Module Name: carry_look_ahead_adder_4
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


module carry_look_ahead_adder_4(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    
    
    wire [3:0] g;
    wire [3:0] p;
    wire [4:0] c;
    //get g
//    assign g[0]=a[0]&b[0];
//    assign g[1]=a[1]&b[1];
//    assign g[2]=a[2]&b[2];
//    assign g[3]=a[3]&b[3];
    assign g[3:0]=a[3:0]&b[3:0];
    
    //get p
//    xor_2 x20(a[0],b[0],p[0]);
//    xor_2 x21(a[1],b[1],p[1]);
//    xor_2 x22(a[2],b[2],p[2]);
//    xor_2 x23(a[3],b[3],p[3]);
//    assign p[0]=a[0]&~b[0] | ~a[0]&b[0];
//    assign p[1]=a[1]&~b[1] | ~a[1]&b[1];
//    assign p[2]=a[2]&~b[2] | ~a[2]&b[2];
//    assign p[3]=a[3]&~b[3] | ~a[3]&b[3];
    assign p[3:0]=a[3:0]^b[3:0];
    
    //get c
    assign c[0]=cin;
    assign c[1]=g[0]|p[0]&c[0];
    assign c[2]=g[1]|p[1]&g[0]|p[1]&p[0]&c[0];
    assign c[3]=g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&c[0];
    assign c[4]=g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0]|p[3]&p[2]&p[1]&p[0]&c[0];
    assign cout=c[4];
    //get s
    xor_3 x30(a[0],b[0],c[0],s[0]);
    xor_3 x31(a[1],b[1],c[1],s[1]);
    xor_3 x32(a[2],b[2],c[2],s[2]);
    xor_3 x33(a[3],b[3],c[3],s[3]);
//    assign s[0]=a[0]&b[0]&c[0] | ~a[0]&~b[0]&c[0] | ~a[0]&b[0]&~c[0] | a[0]&~b[0]&~c[0];
//    assign s[1]=a[1]&b[1]&c[1] | ~a[1]&~b[1]&c[1] | ~a[1]&b[1]&~c[1] | a[1]&~b[1]&~c[1];
//    assign s[2]=a[2]&b[2]&c[2] | ~a[2]&~b[2]&c[2] | ~a[2]&b[2]&~c[2] | a[2]&~b[2]&~c[2];
//    assign s[3]=a[3]&b[3]&c[3] | ~a[3]&~b[3]&c[3] | ~a[3]&b[3]&~c[3] | a[3]&~b[3]&~c[3];
    
endmodule

module xor_2(
    input a,
    input b,
    output x
    );
    
    assign x=a&~b|~a&b;
    
endmodule

module xor_3(
    input a,
    input b,
    input c,
    output x
    );
    
    //assign x=a&b&c | ~a&~b&c | ~a&b&~c | a&~b&~c;
    assign x=a^b^c;
    
endmodule
