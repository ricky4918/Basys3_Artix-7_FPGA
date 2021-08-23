`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2021 03:25:38 PM
// Design Name: 
// Module Name: Seven_Segment
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


module Seven_Segment(
    input [3:0] in,
    output reg[6:0] seg,
    output [3:0] an
    );
    
    always @(in)
    begin
        case (in) //case statement
            4'b0000 : seg = 7'b0000001;
            4'b0001 : seg = 7'b1001111;
            4'b0010 : seg = 7'b0010010; 
            4'b0011 : seg = 7'b0000110;
            4'b0100 : seg = 7'b1001100;
            4'b0101 : seg = 7'b0100100;  
            4'b0110 : seg = 7'b0100000;
            4'b0111 : seg = 7'b0001111;
            4'b1000 : seg = 7'b0000000;
            4'b1001 : seg = 7'b0001100;
            4'b1010 : seg = 7'b0001000; 
            4'b1011 : seg = 7'b1100000;
            4'b1100 : seg = 7'b0110001;
            4'b1101 : seg = 7'b1000010;
            4'b1110 : seg = 7'b0110000;
            4'b1111 : seg = 7'b0111000;
            default : seg = 7'b11111111;
         endcase
    end
    assign an = 4'b1110;
endmodule
