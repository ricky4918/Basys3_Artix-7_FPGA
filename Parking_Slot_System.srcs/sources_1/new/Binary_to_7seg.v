`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2021 11:43:44 AM
// Design Name: 
// Module Name: Binary_to_7seg
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


module segment7(
     data,
     seg,
     an
    );
     
     //Declare inputs,outputs and internal variables.
     input [3:0] data;
     output [6:0] seg;
     output [3:0] an;
     reg [6:0] seg;

//always block for converting bcd digit into 7 segment format
    always @(data)
    begin
        case (data) //case statement
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0001100;
            10 : seg = 7'b0001000;
            11 : seg = 7'b1100000;
            12 : seg = 7'b0110001;
            13 : seg = 7'b1000010;
            14 : seg = 7'b0110000;
            15 : seg = 7'b0111000;
            
            //switch off 7 segment character when the bcd digit is not a decimal number.
        endcase
    end
    assign an = 4'b1110;
endmodule
