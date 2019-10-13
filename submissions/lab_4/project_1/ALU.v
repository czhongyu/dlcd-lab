`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/19 23:38:13
// Design Name: 
// Module Name: ALU
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


module ALU(a,b,cin,m,s,ans,cout);
    input [3:0] a,b;
    input cin,m;
    input [1:0] s;
    output reg [3:0] ans;
    output reg cout;
    
    wire [3:0] ans1,ans2;
    wire cout1,cout2;
    
    carry_look_ahead_adder_4 plus1(a[3:0],b[3:0],cin,ans1[3:0],cout1);
    carry_look_ahead_adder_4 plus2(a[3:0],~b[3:0],~cin,ans2[3:0],cout2);
    
    always@(a,b,cin,m,s,ans1,ans2,cout1,cout2)
    begin
    if(m)
        begin
        case(s)
            2'b00:
                begin
                ans[3:0]=ans1[3:0];
                cout=cout1;
                end
            2'b01:
                begin
                ans[3:0]=ans2[3:0];
                cout=~cout2;
                end
            default:
                begin
                ans[3:0]=4'b0000;
                cout=0;
                end
        endcase
        end
    else
        begin
        case(s)
            2'b00:ans[3:0]=~a[3:0];//not_ not1(a[3:0],ans[3:0]);
            2'b01:ans[3:0]=a[3:0]&b[3:0];//and_ and1(a[3:0],b[3:0],ans[3:0]);
            2'b10:ans[3:0]=a[3:0]|b[3:0];//or_ or1(a[3:0],b[3:0],ans[3:0]);
            2'b11:ans[3:0]=a[3:0]^b[3:0];//xor_ xor1(a[3:0],b[3:0],ans[3:0]);
        endcase
        cout=0;
        end
    end
    
endmodule

//module not_(a,ans);
//    input [3:0] a;
//    output [3:0] ans;
    
//    assign ans[3:0]=~a[3:0];
    
//endmodule

//module and_(a,b,ans);
//    input [3:0] a,b;
//    output [3:0] ans;
    
//    assign ans[3:0]=a[3:0]&b[3:0];
    
//endmodule

//module or_(a,b,ans);
//    input [3:0] a,b;
//    output [3:0] ans;
    
//    assign ans[3:0]=a[3:0]|b[3:0];
    
//endmodule

module carry_look_ahead_adder_4(a,b,cin,ans,cout);
    input [3:0] a;
    input [3:0] b;
    input cin;
    output [3:0] ans;
    output cout;
    
    wire [3:0] g;
    wire [3:0] p;
    wire [3:1] c;
    
    //get g
    assign g[3:0]=a[3:0]&b[3:0];
    
    //get p
    assign p[3:0]=a[3:0]^b[3:0];
    
    //get c
    assign c[1]=g[0]|p[0]&cin;
    assign c[2]=g[1]|p[1]&g[0]|p[1]&p[0]&cin;
    assign c[3]=g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&cin;
    assign cout=g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0]|p[3]&p[2]&p[1]&p[0]&cin;
    
    //get s
    xor_ xor1(p[3:0],{c[3:1],cin},ans[3:0]);
    
endmodule

module xor_(a,b,ans);
    input [3:0] a,b;
    output [3:0] ans;
    
    assign ans[3:0]=a[3:0]^b[3:0];
    
endmodule

//module plus(a,b,cin,ans,cout);
//    input [3:0] a,b;
//    input cin;
//    output [3:0] ans;
//    output cout;
    
//    carry_look_ahead_adder_4 plus1(a[3:0],b[3:0],cin,ans[3:0],cout);
    
//endmodule

//module minus(a,b,cin,ans,cout);
//    input [3:0] a,b;
//    input cin;
//    output [3:0] ans;
//    output cout;
    
//    carry_look_ahead_adder_4 plus1(a[3:0],~b[3:0],~cin,ans[3:0],cout);
    
//endmodule


//        if(~s[1]&~s[0])
//            begin
//            ans[3:0]=ans1[3:0];
//            cout=cout1;
//            end
//        else
//            begin
//            if(~s[1]&s[0])
//                begin
//                ans[3:0]=ans2[3:0];
//                cout=cout2;
//                end
//            else
//                begin
//                ans[3:0]=4'b0000;
//                cout=0;
//                end
//            end
//        end
