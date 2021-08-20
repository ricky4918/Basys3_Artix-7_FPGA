`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2021 11:52:54 AM
// Design Name: 
// Module Name: Two_Bit_Counter
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


module Two_Bit_Counter(
    input clk,
    output [1:0] Q
    );
    
    
    reg [1:0] temp = 0;
    always @(posedge clk)
    begin
    temp <= temp +1;
    end
    
    assign Q = temp;
endmodule
