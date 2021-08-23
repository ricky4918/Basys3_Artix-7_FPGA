`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 01:15:06 PM
// Design Name: 
// Module Name: Button_Debouncer
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


module Button_Debouncer#(parameter threshold = 1000000)
(
    input clk,
    input btn,
    output reg transmit
    );
    
    
    reg button_ff1 = 0;
    reg button_ff2 = 0;
    reg [30:0] count = 0;
    
    
    always @(posedge clk)
    begin
    button_ff1 <= btn;
    button_ff2 <= button_ff1;
    end
    
    
    
    always @(posedge clk)
    if (button_ff2)
    begin
        if (~&count)// if it is not at the count limit, and make sure you wont't count up at the limit
        begin
        count <= count+1;
        end
    end
    else begin
        if(|count)// if count has at least 1 in it, makeing sure no subract when count is 0
        begin
        count<=count-1;
        end
        if (count>threshold)
        begin
        transmit <=1;
        end
        else begin
        transmit <=0;
        end 
     end    
    
endmodule
