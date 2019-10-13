`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 00:59:29
// Design Name: 
// Module Name: traffic_lights_1
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


module traffic_lights_1(
    input clk,
    input reset,
    output reg [2:0] N,
    output reg [2:0] S,
    output reg [2:0] E,
    output reg [2:0] W
    );
    
    wire myclk;
    reg [5:0] counter;
    clkdiv c1(clk,myclk);
    
    always@(posedge myclk, posedge reset)
    begin
    if(reset)
    begin
    N<=3'b001;
    S<=3'b001;
    E<=3'b100;
    W<=3'b100;
    end
    else
    begin
        case(counter)
        6'b001001:
            begin
            N<=3'b010;
            S<=3'b010;
            E<=3'b100;
            W<=3'b100;
            counter<=counter+1;
            end
        6'b001100:
            begin
            N<=3'b100;
            S<=3'b100;
            E<=3'b001;
            W<=3'b001;
            counter<=counter+1;
            end
         6'b011101:
            begin
            N<=3'b100;
            S<=3'b100;
            E<=3'b010;
            W<=3'b010;
            counter<=counter+1;
            end
         6'b100000:
            begin
            N<=3'b001;
            S<=3'b001;
            E<=3'b100;
            W<=3'b100;
            counter<=6'b000000;
            end
        default
            begin
            N<=N;
            S<=S;
            E<=E;
            W<=W;
            counter<=counter+1;
            end
        endcase
    end
    end
    
endmodule

module clkdiv(
    input inclk,
    output outclk
    );
    reg [35:0]q;
    always@(posedge inclk)
         q<=q+1;
    assign outclk=q[26];//around 0.75Hz
endmodule
