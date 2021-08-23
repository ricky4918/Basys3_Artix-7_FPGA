`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 10:41:58 AM
// Design Name: 
// Module Name: D_FF
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


module D_FF(
    input clk,
    output reg Q,
    output reg Q_bar,
    input D
    );
    
    
    
    always @ (posedge clk)
    begin
    Q <= D;
    Q_bar <= ~Q;
    end
    
    
endmodule
