`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2021 12:01:32 PM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [1:0] en,
    output reg [3:0] An
    );
    
    
    always @(en)
    begin
    case(en)
    0: An = 4'b1110;
    1: An = 4'b1101;
    2: An = 4'b1011;
    3: An = 4'b1111;
    endcase
    end 
endmodule
