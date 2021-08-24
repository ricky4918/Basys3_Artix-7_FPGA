`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2021 09:35:52 AM
// Design Name: 
// Module Name: Leds
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


module Leds(
    input clk,
    output reg [15:0] led,
    output reg [7:0] seg,
    output wire [3:0] an
    );
    
    
    reg [23:0] counter =0;
    reg slow_clk = 1'b0;
    reg [3:0] LED_Counter = 4'b0000;
    
    
    
    assign an = 4'b0;
    
    always @(posedge clk)
    begin
        counter <= counter+1;
        if(counter==12_499_999) begin
        counter <= 0;
        slow_clk = ~slow_clk;
        end
    end
    
    always @(posedge slow_clk)
        if(LED_Counter == 15) begin
        LED_Counter <= 0;
        end
        else begin
        LED_Counter <= LED_Counter + 1'b1;
        end
       
     always @(posedge slow_clk)
        case(LED_Counter)
            4'b0000: begin
                        led = 16'h0000;
                        seg = 8'b11111110;
                     end
            4'b0001: begin
                        led = 16'hFFFD;
                        seg = 8'b11111101;
                     end
            4'b0010: begin
                        led = 16'hFFFB;
                        seg = 8'b11110111;
                      end 
            4'b0011: begin
                        led = 16'hFFF7;
                        seg = 8'b11101111;
                     end
            4'b0100: begin
                        led = 16'hFFEF;
                        seg = 8'b11011111;
                     end
            4'b0101: begin
                        led = 16'hFFDF;
                        seg = 8'b10111111;
                      end
            4'b0111: begin
                        led = 16'hFFBF;
                        seg = 8'b01111111;
                     end
            4'b1000: begin
                        led = 16'hFF7F;
                        seg = 8'b11111011;
                     end
            4'b1001: begin
                        led = 16'hFEFF;
                        seg = 8'b01111111;
                      end
            4'b1010: begin
                        led = 16'hFDFF;
                        seg = 8'b10111111;
                      end
            4'b1011: begin
                        led = 16'hFBFF;
                        seg = 8'b11011111;
                      end
            4'b1100: begin
                        led = 16'hF7FF;
                        seg = 8'b11101111;
                      end
            4'b1101: begin
                        led = 16'hEFFF;
                        seg = 8'b11111101;
                      end 
            4'b1110: begin
                        led = 16'hDFFF;
                        seg = 8'b11111110;
                      end 
             4'b1111: begin
                        led = 16'hBFFF;
                        seg = 8'b00000000;
                      end                             
            default : begin
            end
            endcase   
    
endmodule
