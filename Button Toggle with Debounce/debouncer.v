`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2025 21:55:03
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input clk, reset_n,
    input noisy,
    output debounced
    );
    
    wire timer_done, timer_reset;
    
    fsm FSM0(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .timer_done(timer_done),
        .timer_reset(timer_reset),
        .debounced(debounced)
    );
    
    timer_param #(.FINAL_VALUE(1_999_999)) T0(
        .clk(clk),
        .reset_n(~timer_reset),
        .enable(~timer_reset),
        .done(timer_done)
    );
endmodule