`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2021 01:20:52 PM
// Design Name: 
// Module Name: Mirror_Display_1
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


module Mirror_Display_1(
    input wire [7:0] Temperature,
    input wire [7:0] Average_mpg,
    input wire [7:0] Instantaneous_mpg,
    input wire [7:0] Miles_Remaining,
    input wire [1:0] SS,
    output reg [7:0] Display
    );
    
    
    
    always @(*)
    case(SS)
    0: Display = Temperature;
    1: Display = Average_mpg;
    2: Display = Instantaneous_mpg;
    3: Display = Miles_Remaining;
    endcase
    
    
    
    
    
endmodule
