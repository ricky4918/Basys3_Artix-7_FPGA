`timescale 1ns / 1ps



module Read_Pointer(
    input Rd,
    input FIFO_empty,
    input clk,
    input Rst_n,
    output reg [4:0] Rptr,
    output FIFO_Rd
    );
    
   assign FIFO_Rd = (~FIFO_empty) & Rd;
   
   always @(posedge clk or negedge Rst_n)
   begin
    if(~Rst_n) 
        Rptr <= 0;
    else if(FIFO_Rd)
        Rptr <= Rptr + 1;
    else
        Rptr <= Rptr;
    end
    
endmodule
