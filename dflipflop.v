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
    output reg q
    );
    
    initial begin
    q = 0;  //Q = 0 initially
    end
    
    always@(posedge clk) begin
    q  <= D;
    end
    
    
    
endmodule
