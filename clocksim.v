`timescale 1ms / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 02:38:38 PM
// Design Name: 
// Module Name: clocksim
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


module clocksim(

    );
    reg clk, reset, enable, mode;
    wire [3:0] timer10ms;
    wire [3:0] timer100ms;
    wire [3:0] timer1sec;
    wire [3:0] timer10sec;
    wire [3:0] timer1min;
    wire [3:0] timer10min;
    
    clock dut (.clk(clk),.reset(reset),.enable(enable),.mode(mode),.timer10ms(timer10ms),.timer100ms(timer100ms),
    .timer1sec(timer1sec),.timer10sec(timer10sec),.timer1min(timer1min),.timer10min(timer10min));
    
    initial
    begin
    forever #5 clk = ~clk;  //flips clk every 5ms, 10 ms period
    end
    
    initial
    begin
    clk = 0;
    mode = 1;
    enable = 1;
    
    //initial reset
    reset = 1;
    #10;
    reset = 0;
    
    //normal operation
    #10000; 
    
    //show that when enable is false, stopwatch stops
    enable = 0; 
    #100;
    enable = 1;
    #100;
    
    //show when reset is 1, timer goes to 0
    reset = 1;
    #100;
    reset = 0;
    #100;
    //shows that counting continues while mode is false, but does not display
    mode = 0;
    #100;
    mode = 1;
    #100;
    
    end
    
endmodule
