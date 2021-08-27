`timescale 1ns / 1ps


module Memory_Array(
    input [7:0] data_in,
    input clk,
    input FIFO_we,
    input [4:0] Wptr,
    input [4:0] Rptr,
    output [7:0] Data_out
    );
    
    
    reg[7:0] data_out2[15:0]; //8-bit data + 16 stages
    wire[7:0] dtat_out;
    
   always @(posedge clk)
   begin
    if(FIFO_we)
        data_out2[Wptr[3:0]] <= data_in;
    end
    assign Data_out = data_out2[Rptr[3:0]];
    
    endmodule
    
    
    
    

