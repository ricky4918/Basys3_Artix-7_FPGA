`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2021 02:02:42 PM
// Design Name: 
// Module Name: Basic_Calculator
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


module Basic_Calculator(
    input [9:0] sw,
    output [7:0] LED
    );
    
    wire [7:0] addition;
    wire [7:0] subtraction;
    wire [7:0] multplication;
    wire [7:0] division;
    
    assign addition = sw[7:4] + sw[3:0];
    assign subtraction = sw[7:4] - sw[3:0];
    assign multplication = sw[7:4] * sw[3:0];
    assign division = sw[7:4] / sw[3:0];
    
   assign LED = ({8{~sw[9]}} & {8{~sw[8]}} & addition) | ({8{~sw[9]}} & {8{sw[8]}} & subtraction) | ({8{sw[9]}} & {8{~sw[8]}} & multplication) | ({8{sw[9]}} & {8{sw[8]}}&  division);
    
    
    
endmodule
