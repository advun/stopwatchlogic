`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 01:42:22 PM
// Design Name: 
// Module Name: modeselecter
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


module modeselecter(
input [3:0] q,
input mode,
output [3:0] qout
    );
    
   assign qout[0] = (q[0]&mode);
   assign qout[1] = (q[1]&mode);
   assign qout[2] = (q[2]&mode);
   assign qout[3] = (q[3]&mode);
    
    
    
endmodule
