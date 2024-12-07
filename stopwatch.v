`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 01:55:58 PM
// Design Name: 
// Module Name: stopwatch
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


module stopwatch(
input clk,
input reset,
input enable,
input mode,
output [6:0] display10ms,
output [6:0] display100ms,
output [6:0] display1sec,
output [6:0] display10sec,
output [6:0] display1min,
output [6:0] display10min
    );
    
   wire [3:0] hold10ms;
   wire [3:0] hold100ms;
   wire [3:0] hold1s;
   wire [3:0] hold10s;
   wire [3:0] hold1m;
   wire [3:0] hold10m;
    
    clock c0(clk, reset, enable, mode, hold10ms, hold100ms, hold1s, hold10s, hold1m, hold10m);
    
    sevensegment o0(hold10ms, display10ms);
    sevensegment o1(hold100ms, display100ms);
    sevensegment o2(hold1s, display1sec);
    sevensegment o3(hold10s, display10sec);
    sevensegment o4(hold1m, display1min);
    sevensegment o5(hold10m, display10min);
    
endmodule
