`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/03 15:58:59
// Design Name: 
// Module Name: digital_clock
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

module digital_clock(
    input clk,
    input [13:0] swt,
    input reset,
    input myset,
    output reg [6:0] C,
    output reg DP,
    output reg [7:0] AN
    );
    
    //led
    wire [6:0] C1;
    wire [6:0] C2;
    wire [6:0] C3;
    wire [6:0] C4;
    
    //time
    reg [3:0] T1;
    reg [3:0] T2;
    reg [3:0] T3;
    reg [3:0] T4;
    
    //counter
    reg [1:0] cnt;
    
    wire myclk1,myclk2;
    clkdiv1 c1(clk,myclk1);//time
    clkdiv2 c2(clk,myclk2);//display
    
    always@(posedge myclk1)//beep
        DP<=~DP;
    
    always@(posedge myclk1, posedge reset, posedge myset)//set time
    begin
    if(reset)
    begin
        T4<=4'b0000;
        T3<=4'b0000;
        T2<=4'b0000;
        T1<=4'b0000;
    end  
    else
    if(myset)
    begin
        T4<={0,0,swt[13],swt[12]};
        T3<=swt[11:8];
        T2<=swt[7:4];
        T1<=swt[3:0];
    end  
    else
        if(T4==4'b0010&T3==4'b0011&T2==4'b0101&T1==4'b1001)//23:59
        begin
            T4<=4'b0000;
            T3<=4'b0000;
            T2<=4'b0000;
            T1<=4'b0000;
        end
        else
            if(T3==4'b1001&T2==4'b0101&T1==4'b1001)//x9:59
            begin
                T4<=T4+1;
                T3<=4'b0000;
                T2<=4'b0000;
                T1<=4'b0000;
            end
            else
                if(T2==4'b0101&T1==4'b1001)//xx:59
                begin
                    T4<=T4;
                    T3<=T3+1;
                    T2<=4'b0000;
                    T1<=4'b0000;
                end
                else
                    if(T1==4'b1001)//xx:x9
                    begin
                        T4<=T4;
                        T3<=T3;
                        T2<=T2+1;
                        T1<=4'b0000;
                    end
                    else//xx:xx
                    begin
                        T4<=T4;
                        T3<=T3;
                        T2<=T2;
                        T1<=T1+1;
                    end
    end
    
    //set led
    BCD_7_segment_display b1(T1[3:0],C1[6:0]);
    BCD_7_segment_display b2(T2[3:0],C2[6:0]);
    BCD_7_segment_display b3(T3[3:0],C3[6:0]);
    BCD_7_segment_display b4(T4[3:0],C4[6:0]);
    
    //display
    always@(posedge myclk2)
    begin
        case(cnt)
        2'b00:
            begin
            AN<=8'b11111110;
            C<=C1;
            cnt<=cnt+1;
            end
        2'b01:
            begin
            AN<=8'b11111101;
            C<=C2;
            cnt<=cnt+1;
            end
        2'b10:
            begin
            AN<=8'b11111011;
            C<=C3;
            cnt<=cnt+1;
            end
        2'b11:
            begin
            AN<=8'b11110111;
            C<=C4;
            cnt<=cnt+1;
            end
        endcase
    end
    
endmodule

module BCD_7_segment_display(
    input [3:0] swt,
    output reg [6:0] C
    );
    
    //set 7 segment
    always@(swt)
    begin
    case(swt)
    4'b0000:C=7'b0000001;
    4'b0001:C=7'b1001111;
    4'b0010:C=7'b0010010;
    4'b0011:C=7'b0000110;
    4'b0100:C=7'b1001100;
    4'b0101:C=7'b0100100;
    4'b0110:C=7'b0100000;
    4'b0111:C=7'b0001111;
    4'b1000:C=7'b0000000;
    4'b1001:C=7'b0000100;
    default:C=7'b0000001;//consider it 0
    endcase
    end
    
endmodule

module clkdiv1(
    input inclk,
    output outclk
    );
    reg [35:0]q;
    always@(posedge inclk)
         q<=q+1;
    assign outclk=q[26];//around 0.75Hz
endmodule

module clkdiv2(
    input inclk,
    output outclk
    );
    reg [35:0]q;
    always@(posedge inclk)
         q<=q+1;
    assign outclk=q[16];//around 3kHz
endmodule
