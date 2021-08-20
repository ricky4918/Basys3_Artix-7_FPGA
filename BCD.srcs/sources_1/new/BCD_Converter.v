`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2021 11:11:21 AM
// Design Name: 
// Module Name: BCD_Converter
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


module BCD_Converter(
    input [7:0] A,
    output [3:0] ones,
    output [3:0] tens,
    output [3:0] hundreds
    );
    
    wire [3:0] c1, c2, c3, c4, c5, c6, c7; // out of shift_add3_module
    wire [3:0] d1, d2, d3 ,d4, d5, d6, d7; // going in shift_add3_module
    
    
    assign d1 = { 1'b0 , A[7:5] };
    assign d2 = { c1[2:0], A[4] };
    assign d3 = { c2[2:0], A[3] };
    assign d4 = { c3[2:0], A[2] };
    assign d5 = { c4[2:0], A[1] };
    assign d6 = { 1'b0, c1[3], c2[3],  c3[3] };
    assign d7 = { c6[2:0], c4[3] }; 
    
    
    Shift_Add3_algorithm U1(d1,c1);
    Shift_Add3_algorithm U2(d2,c2);
    Shift_Add3_algorithm U3(d3,c3);
    Shift_Add3_algorithm U4(d4,c4);
    Shift_Add3_algorithm U5(d5,c5);
    Shift_Add3_algorithm U6(d6,c6);
    Shift_Add3_algorithm U7(d7,c7);
    
    assign ones = {c5[2:0], A[0]};
    assign tens = {c7[2:0], c5[3]};
    assign hundres = {1'b0, 1'b0, c6[3], c7[3] };
    
    
    
    
    
    
    
    
    
    
endmodule
