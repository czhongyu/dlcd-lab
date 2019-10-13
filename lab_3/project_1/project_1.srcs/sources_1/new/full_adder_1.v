`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 10:50:25
// Design Name: 
// Module Name: full_adder_1
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


module full_adder_1(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
    //using assign statement
    assign s=~a&~b&cin | ~a&b&~cin | a&~b&~cin | a&b&cin;
    assign cout=a&b | a&cin | b&cin;
    
//    //using nand, not
//    wire a_not,b_not,cin_not;
//    wire not1,not2,not3,not4;
//    wire nand11,nand12,nand21,nand22,nand31,nand32,nand41,nand42;
//    wire nand111,nand222;
//    wire not111,not222,not333;
    
//    wire nand101,nand102,nand103;
//    wire nand201,nand202;
//    wire not101;
    
//    //get s
//    not
//        g0(a_not,a),
//        g1(b_not,b),
//        g2(cin_not,cin);
//    nand
//        g3(nand11,a_not,b_not),
//        g4(nand21,a,cin),
//        g5(nand31,b,cin),
//        g6(nand41,a,b);
//    not
//        g7(not1,nand11),
//        g8(not2,nand21),
//        g9(not3,nand31),
//        g10(not4,nand41);
//    nand
//        g11(nand12,not1,cin_not),
//        g12(nand22,not2,b_not),
//        g13(nand32,not3,a_not),
//        g14(nand42,not4,cin_not);
        
//    nand
//        g15(nand111,nand12,nand22),
//        g16(nand222,nand32,nand42);
    
//    not
//        g17(not111,nand111),
//        g18(not222,nand222);
        
//    nand
//        g19(nand333,not111,not222);
        
//    not
//        g20(s,nand333);
        
//    //get cout
//    nand
//        g21(nand101,a_not,b_not),
//        g22(nand102,a_not,cin_not),
//        g23(nand103,b_not,cin_not),
        
//        g24(nand201,nand101,nand102);
    
//    not
//        g25(not101,nand201);
        
//    nand
//        g26(nand202,not101,nand103);
    
//    not
//        g27(cout,nand202);
    
endmodule
