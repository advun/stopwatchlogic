`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 12:22:41 PM
// Design Name: 
// Module Name: modninecount
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


module modninecount(
    input clk,
    input reset,
    input enable,
    output [3:0] q,
    output flag
    );
    
    
    wire nineout, unset;
    
    
    counter d0(0, enable, 0, 0, 0, 0, clk, unset, q);
    assign flag = ((q[3])&(q[0])); //signal next timer if this timer is at 9
    assign nineout = ((q[3])&(q[1])); // 1010 = 10, this timer should be reset if reaches 10
    assign unset = (nineout|reset); //reset to 0 if at 10 or if reset
    
    
    
endmodule
