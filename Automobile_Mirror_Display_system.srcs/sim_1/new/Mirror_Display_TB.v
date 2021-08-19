`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2021 01:30:54 PM
// Design Name: 
// Module Name: Mirror_Display_TB
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


module Mirror_Display_TB(

);
    reg [7:0] Temperature;
    reg [7:0] Average_mpg;
    reg [7:0] Instantaneous_mpg;
    reg [7:0] Miles_Remaining;
    reg [1:0] SS;
    wire [7:0] Display;

    Mirror_Display_1 U0(Temperature, Average_mpg, Instantaneous_mpg, Miles_Remaining, SS, Display);



    initial begin
        Temperature = 8'b0;
        Average_mpg = 8'b10011000; //152
        Instantaneous_mpg = 8'b00010010; //18
        Miles_Remaining = 8'b11110000; //240
        SS = 2'b00;
        #100;
        Average_mpg = 8'b10011000; //152
        Instantaneous_mpg = 8'b10010010; //146
        Miles_Remaining = 8'b00001111; //15
        SS = 2'b11;
        #1000;
        $finish;

    end


endmodule
