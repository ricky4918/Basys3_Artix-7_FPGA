`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2021 09:54:04 AM
// Design Name: 
// Module Name: Write_Pointer
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


module Write_Pointer(

    input Wr,
    input FIFO_full,
    input clk,
    input Rst_n,
    output FIFO_we,
    output reg [4:0] Wptr
    );
    
    
    
    assign FIFO_we = (~FIFO_full) & Wr;
   
   always @(posedge clk or negedge Rst_n)
   begin
    if(~Rst_n) 
        Wptr <= 0;
    else if(FIFO_we)
        Wptr <= Wptr + 1;
    else
        Wptr <= Wptr;
    end

endmodule
