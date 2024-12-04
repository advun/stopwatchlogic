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
    output reg [3:0] q,
    output flag
    );
    
    initial begin
    q[0] = 0;  //Q = 0 initially
    q[1] = 0;
    q[2] = 0;
    q[3] = 0;
    end
    
    wire fiveout, load;
    
    assign flag = ((q[0])&(q[2])); //signal next timer if this timer is at 5
    assign fiveout = ((q[0])*(q[2])); // 0101 = 5
    assign load = (fiveout|reset); //reset to 0 if 0101 or if reset
    
    counter d0(load, enable, 0, 0, 0, 0, clk, q);
    
    
endmodule
