`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/09 23:53:39
// Design Name: 
// Module Name: bus
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


module bus(
    input clk,
    input [14:0] SW,
    output [15:0] LED
    );
    
    wire myclk;
    wire [3:0] d1;
    wire [3:0] y;
    wire [15:0] light;
    clkdiv U0(clk,myclk);
    
    register U1(myclk,SW[7],d1[3:0],light[11:8]);
    assign LED[11:8]=light[11:8];
    register U2(myclk,SW[6],y[3:0],light[3:0]);
    assign LED[3:0]=light[3:0];
    register U3(myclk,SW[5],y[3:0],light[7:4]);
    assign LED[7:4]=light[7:4];
    ram2 U4(myclk,SW[0],SW[4:1],y[3:0],light[15:12]);
    assign LED[15:12]=light[15:12];
    
    MUX_2_1 U5(SW[12],SW[11:8],y[3:0],d1[3:0]);
    MUX_4_1 U6(SW[14:13],light[11:8],light[3:0],light[7:4],light[15:12],y[3:0]);
    
endmodule

module register(
    input myclk,
    input en,
    input [3:0] d,
    output reg [3:0] q
    );
    
    always@(posedge myclk,posedge en)
    begin
        if(en)
            q<=d;
    end

endmodule

module ram2(
    input clk,
    input wen,
    input [3:0] addr,
    input [3:0] din,
    output [3:0] qout
    );
    reg[3:0]ram[0:15];
    always@(posedge clk)
      if(wen)
        ram[addr]<=din;
      assign qout=ram[addr];  
endmodule

module clkdiv(
    input mclk,
    output clk1_4hz
    );
    
    reg [27:0]q;
    always@(posedge mclk)
         q<=q+1;

    assign clk1_4hz=q[24];
         
endmodule

module MUX_4_1(
    input [1:0] s,
    input [3:0] i0,
    input [3:0] i1,
    input [3:0] i2,
    input [3:0] i3,
    output reg [3:0] y
    );
    
    always@(*)
    begin 
        case(s)
        2'b00:y<=i0;
        2'b01:y<=i1;
        2'b10:y<=i2;
        2'b11:y<=i3;
        endcase
    end

endmodule

module MUX_2_1(
    input s,
    input [3:0] i0,
    input [3:0] i1,
    output reg [3:0] y
    );
    
    always@(*)
    begin
        case(s)
        1'b0:y<=i0;
        1'b1:y<=i1;
        endcase
    end
    
endmodule
