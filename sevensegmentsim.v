`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 02:00:59 PM
// Design Name: 
// Module Name: sevensegment
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


module sevensegment(
input [3:0] ABCD,
output[6:0] abcdefg
    );
    
    wire A,B,C,D;
    assign A = ABCD[3];
    assign B = ABCD[2];
    assign C = ABCD[1];
    assign D = ABCD[0];
    
    
    assign abcdefg[0] = (C|A|(~B&~D)|B&D);
    assign abcdefg[1] = (~B|(C&D)|(~C&~D));
    assign abcdefg[2] = (~C|B|D);
    assign abcdefg[3] = ((~B&~D)|(~B&C)|(C&~D)|(B&~C&D));
    assign abcdefg[4] = ((~B&~D)|(C&~D));
    assign abcdefg[5] = (A|(B&~D)|(~C&~D)|(B&~C));
    assign abcdefg[6] = (A|(~B&C)|(B&~D)|(B&~C));
    
    endmodule
