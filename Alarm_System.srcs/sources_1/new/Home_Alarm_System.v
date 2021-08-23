`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2021 03:23:52 PM
// Design Name: 
// Module Name: Home_Alarm_System
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


module Home_Alarm_System(
    input [3:0] sw,
    input en,
    output reg S_out
    );
    
    always @(*)
    if((sw[0] | sw[1] | sw[2] | sw[3]) & en)
    begin
    S_out = 1'b1;
    end
    
    
    
    
endmodule
