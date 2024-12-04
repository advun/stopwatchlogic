`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 11:37:00 AM
// Design Name: 
// Module Name: dflipflop
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


module dflipflop(
    input D,
    input clk,
    input reset,
    output reg q
    );
    
    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            q = 1'b0;  
        end
        else
        begin
            q=D; 
        end
    end 
    
endmodule
