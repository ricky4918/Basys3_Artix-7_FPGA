`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2021 02:57:41 PM
// Design Name: 
// Module Name: Led_Blink
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


module Slow_Clock(
    input clk_in,
    output reg clk_out
    );
    
    reg[25:0] count=0;

    always @(posedge clk_in)
    begin
    count <= count+1;
    if(count==12_500_000) // 4HZ
    begin
    count <= 0;
    clk_out = ~clk_out;
    end
    end
   
endmodule
