`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/27 10:17:17
// Design Name: 
// Module Name: binary_counter
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


module binary_counter(A,B,C,D,clear,load,P,T,clk,Q,RCO);
    
    input A,B,C,D;
    input clear,load,P,T;
    input clk;
    output [3:0]Q;
    output RCO;
    reg [3:0]Q;
    reg RCO;
    wire myclk;
    clkdiv a(clk,myclk);
    always@(posedge myclk)
    begin
        if(!clear)
        begin 
        Q<=4'b0000;
        end
        else 
        if(!load)
        begin 
        Q<={D,C,B,A};
        end
        else 
        casex({P,T})
            2'b0x:begin Q<=Q;end
            2'bx0:begin Q<=Q;end
            2'b11:
            begin
                if(Q==4'b1110)
                begin
                    Q<=Q+1;
                    RCO<=1'b1;
                end
                else
                begin
                    Q<=Q+1;
                    RCO<=1'b0;
                end
            end
        endcase
    end
    
endmodule


module clkdiv(
    input mclk,
   // input clr,
    //output clk190,
    //output clk48,
    output clk1_4hz
    );
    reg [27:0]q;
    always@(posedge mclk)
  //  begin
   // if(!clr)
   //      q<=0;
  //  else
         q<=q+1;
  //  end
    //assign clk190=q[18];//190hz
    //assign clk48=q[20];//47.7 
    assign clk1_4hz=q[26];         
endmodule
