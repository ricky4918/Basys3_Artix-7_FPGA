`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 01:44:58 PM
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(
    input [7:0] data,
    input clk,
    input transmit,
    input btn,
    input reset,
    output TxD,
    output TxD_debug,
    output transmit_debbug,
    output btn_debug,
    output clk_debug
    );
    
    wire transmitting_out;
    
    transmitter T1(clk, data, transmitting_out, reset, TxD);
    
    Button_Debouncer(clk, transmit, transmitting_out);
    
    assign TxD_debug = TxD;
    assign transmit_debbug = transmitting_out;
    assign btn_debug = reset;
    assign clk_debug = clk;
    
    
    
    
    
endmodule
