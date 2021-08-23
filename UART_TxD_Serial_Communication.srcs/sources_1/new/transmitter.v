`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 11:48:34 AM
// Design Name: 
// Module Name: transmitter
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

//Baud Rate of 9600 bps(counter = clock/BR)
module transmitter(
    input clk,
    input [7:0] data,
    input transmit,
    input reset,
    output reg TxD
    );
    
    reg [3:0] bit_counter; //Counter to count the 10 bits
    reg [13:0] baudrate_counter;//10,415
    reg [9:0] shiftright_register; //10bits that will be serially trasmitted through UART to basys-3
    
    reg state, next_state;//idle mode and transmitting mode
    reg shift; // shift signal to start shifting the bits in the UART
    reg load; //load signal to start loading the data in to the shiftright register, and add start and stop
    reg clear; // reset the bit counter for UART transmission
    
    
    //UART transmission
    
    
    always @(posedge clk)
    begin
    if(reset)
    begin
    state <=0;
    bit_counter <=0;
    baudrate_counter<=0;
    end
    
    else begin
    baudrate_counter <= baudrate_counter +1;
     if (baudrate_counter == 10415)
     begin
     state <= next_state;
     baudrate_counter <=0;
        if (load)
        shiftright_register <= {1'b0, data, 1'b0};
        if (clear)
        bit_counter <=0;
        if (shift)
        shiftright_register <= shiftright_register >>1;
        bit_counter <= bit_counter +1;
        end
     end
     end
    
    
    always @(posedge clk)
    begin
    load <=0;
    shift <=0;
    clear <=0;
    TxD <=1; // when set to 1, there is no transmission in progress
    case(state)
        0:
            if(transmit)
            begin
            next_state<=1;//it moves/switches to transmission state
            load<=1;
            shift<=0;
            clear<=0;
            end
            else begin
            next_state <=0;
            TxD<=1;
            end
    
          1: 
             if(bit_counter ==10)
             begin
             next_state<=0;
             clear<=1;
             end
             else begin
             next_state<=1;
             TxD<=shiftright_register[0];
             shift<=1;
             end
             default: next_state<=0;
             endcase
      end
      
endmodule
