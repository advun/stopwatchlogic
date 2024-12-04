`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 11:49:24 AM
// Design Name: 
// Module Name: counter
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


module counter(
    input Load,
    input Count,
    input d0,
    input d1,
    input d2,
    input d3,
    input clk,
    output reg [3:0] q
    //output CO
    );
    
    
    initial begin
    q[0] = 0;  //Q = 0 initially
    q[1] = 0;
    q[2] = 0;
    q[3] = 0;
    end
    
    wire LNC, d0L, d1L, d2L, d3L;
    wire d0in, d1in, d2in, d3in;
    wire LNCxq0, q0xq1, q1xq2, q2xq3;
    wire carry0, carry1 /*carry2*/;
    
    
    
    assign LNC = (~Load&Count); //Load not * Count
    
    
    //Q0
    assign d0L = (d0&Load); //d0 and Load
    assign LNCxq0 = (LNC^(q[0])); //(Load not * Count) xor q0
    assign d0in = (d0L|LNCxq0); //input to first dflipflop 
    assign carry0 = (LNC&(q[0])); //carry from the first dflipflop
    dflipflop f0(d0in, clk, q[0]);
    
    //Q1
    assign d1L = (d1&Load); //d1 and Load
    assign q0xq1 = (carry0^(q[1])); // carry0 xor q1
    assign d1in = (d1L|q0xq1); //input to second dflipflop 
    assign carry1 = (carry0&(q[1]));//carry from the second dflipflop
    dflipflop f1(d1in, clk, q[1]);
    
    //Q2
    assign d2L = (d2&Load); //d2 and Load
    assign q1xq2 = (carry1^(q[2])); // carry1 xor q2
    assign d2in = (d2L|q1xq2); //input to second dflipflop 
    assign carry2 = (carry1&(q[2]));//carry from the third dflipflop
    dflipflop f3(d2in, clk, q[2]);
    
    //Q3
    assign d3L = (d3&Load); //d1 and Load
    assign q2xq3 = (carry2^(q[3])); // carry2 xor q3
    assign d3in = (d3L|q2xq3); //input to second dflipflop 
    //assign CO = (carry2&(q[3]));//carry from the second dflipflop
    dflipflop f4(d3in, clk, q[3]);
 
endmodule
