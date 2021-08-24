`timescale 1ns / 1ps

// Debouncing DFFs for push buttons on FPGA
module DFF_PWM(
 input clk,
 input sw,
 input D,
 output reg Q
);

always @(posedge clk)
begin 
 if(sw==1) // slow clock enable signal 
  Q <= D;
end 
endmodule