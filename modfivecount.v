`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 12:20:44 PM
// Design Name: 
// Module Name: modfivecount
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


module modfivecount(
    input clk,
    input reset,
    input enable,
    output [3:0] q,
    output flag
    );
    
    
    wire fiveout, load;
    
    counter d0(load, enable, 0, 0, 0, 0, clk, reset, q);
    
    assign flag = ((q[0])&(q[2])); //signal next timer if this timer is at 5
    assign fiveout = ((q[0])*(q[2])); // 0101 = 5
    assign load = (fiveout|reset); //reset to 0 if 0101 or if reset
    
    
endmodule
