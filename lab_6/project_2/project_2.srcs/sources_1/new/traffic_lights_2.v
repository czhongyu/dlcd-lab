`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 07:51:46
// Design Name: 
// Module Name: traffic_lights_2
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


module traffic_lights_2(
    input C,
    input clk,
    input reset,
    output reg [2:0] H,
    output reg [2:0] F
    );
    
    wire TS,TL;
    wire myclk;
    reg ST;
    wire ST1;
    wire [2:0] H1;
    wire [2:0] F1;
    clkdiv c1(clk,myclk);
    counter cnt1(myclk,ST1,TS,TL);
    always@(ST1)
        ST<=ST1;
    FSM f1(TS,TL,C,ST1,H1[2:0],F1[2:0]);
    always@(TS,TL,reset,C)
    begin
        if(reset)
        begin
        H<=3'b001;
        F<=3'b100;
        ST<=1;
        end
        else
        begin
        H<=H1;
        F<=F1;
        end
        
    end
    
endmodule

module counter(
    input myclk,
    input ST,
    output reg TS,
    output reg TL
    );
    
    reg [3:0] counter;
    always@(posedge myclk, posedge ST)
    begin
    if(ST)
    begin
        TS<=0;
        TL<=0;
        counter<=4'b0000;
    end
    else
        case(counter)
        4'b0000:
            begin
            TS<=1;
            TL<=0;
            end
        4'b0101:
            begin
            TS<=0;
            TL<=1;
            end
        default: 
            begin
            TS<=0;
            TL<=0;
            end
        endcase
    end
    
endmodule

module FSM(
    input TS,
    input TL,
    input C,
    output reg ST,
    output reg [2:0] H,
    output reg [2:0] F
    );
    
    always@(posedge TS,posedge TL,posedge C)
    begin
        if(~(TL&C))
        begin
        H<=3'b001;
        F<=3'b100;
        ST<=ST;
        end
        else
            if(TL&C)
            begin
            ST<=0;
            H<=3'b010;
            F<=3'b100;
            end
            else
            if(~TS)
            begin
            H<=H;
            F<=F;
            end
            else
        if(~(TL|~C))
        begin
        H<=3'b100;
        F<=3'b001;
        end
        else
        if(TS)
        begin
            if(H==3'b010)
            begin
            H<=3'b100;
            F<=3'b001;
            ST<=ST;
            end
            else
            if(F==3'b010)
            begin
            H<=3'b001;
            F<=3'b100;
            ST<=ST;
            end
        end
        else
            if(~(TL|(~C)))
            begin
            F<=F;
            H<=H;
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
    assign outclk=q[27];//around 0.37Hz
endmodule