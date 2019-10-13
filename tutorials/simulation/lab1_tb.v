`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab1_tb
/////////////////////////////////////////////////////////////////
module lab1_tb;
    
    reg [7:0] switches;
    wire [7:0] leds;
        
    integer i;
    
    lab1 dut(.LED(leds),.SW(switches));
     
    initial
    begin
        for (i=0; i < 255; i=i+2)
        begin
            #50 switches=i;
        end
    end
      
endmodule

