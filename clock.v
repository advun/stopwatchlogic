`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 01:03:47 PM
// Design Name: 
// Module Name: clock
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

module clock(
input clk,
input reset,
input enable,
input mode,
output [3:0] timer10ms,
output [3:0] timer100ms,
output [3:0] timer1sec,
output [3:0] timer10sec,
output [3:0] timer1min,
output [3:0] timer10min
    );
    
   wire timer0flag, timer1flag, timer2flag, timer3flag, timer4flag, timer5flag; //flag to enable next counter
   wire [3:0] hold10ms;
   wire [3:0] hold100ms;
   wire [3:0] hold1s;
   wire [3:0] hold10s;
   wire [3:0] hold1m;
   wire [3:0] hold10m;
   
   
   
   modninecount c0(clk, reset, enable, hold10ms, timer0flag); //10 ms timer
   modninecount c1(clk, reset, timer0flag, hold100ms, timer1flag); //100 ms timer
   modninecount c2(clk, reset, (timer0flag & timer1flag), hold1s, timer2flag); //1 sec timer
   modfivecount c3(clk, reset, (timer0flag & timer1flag & timer2flag), hold10s, timer3flag); //10 sec timer
   modninecount c4(clk, reset, (timer0flag & timer1flag & timer2flag & timer3flag), hold1m, timer4flag); //1 min timer
   modfivecount c5(clk, reset, (timer0flag & timer1flag & timer2flag & timer3flag & timer4flag), hold10m, timer5flag); //10 min timer
   
   modeselecter v0(hold10ms, mode, timer10ms);
   modeselecter v1(hold100ms, mode, timer100ms);
   modeselecter v2(hold1s, mode, timer1sec);
   modeselecter v3(hold10s, mode, timer10sec);
   modeselecter v4(hold1m, mode, timer1min);
   modeselecter v5(hold10m, mode, timer10min);

    
endmodule
