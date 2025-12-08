`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2025 15:48:15
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input [3:0] SW,
    input CLK,
    output reg [7:0] SSEG_CA,
    output reg [7:0] SSEG_AN,
    output reg [3:0] LED
);

wire clk_slow;
slow_clock S1 (CLK, clk_slow);

initial begin
    SSEG_AN = 8'b11111110;  
end
always @(*) begin
    case (SW)
        4'b0000: SSEG_CA = 8'b11000000;  
        4'b0001: SSEG_CA = 8'b11111001;
        4'b0010: SSEG_CA = 8'b10100100;
        4'b0011: SSEG_CA = 8'b10110000;
        4'b0100: SSEG_CA = 8'b10011001;
        4'b0101: SSEG_CA = 8'b10010010;
        4'b0110: SSEG_CA = 8'b10000010;
        4'b0111: SSEG_CA = 8'b11011000;
        4'b1000: SSEG_CA = 8'b10000000;
        4'b1001: SSEG_CA = 8'b10011000;
        4'b1010: SSEG_CA = 8'b10001000;
        4'b1011: SSEG_CA = 8'b10000000;
        4'b1100: SSEG_CA = 8'b11000110;
        4'b1101: SSEG_CA = 8'b10100001;
        4'b1110: SSEG_CA = 8'b10000110;
        4'b1111: SSEG_CA = 8'b10001110;
        default: SSEG_CA = 8'b11111111;
    endcase
end

always @(*) begin
    LED = SW;
end

always @(posedge clk_slow) begin
    case (SSEG_AN)
        8'b11111110: SSEG_AN <= 8'b11111101;
        8'b11111101: SSEG_AN <= 8'b11111011;
        8'b11111011: SSEG_AN <= 8'b11110111;
        8'b11110111: SSEG_AN <= 8'b11101111;
        8'b11101111: SSEG_AN <= 8'b11011111;
        8'b11011111: SSEG_AN <= 8'b10111111;
        8'b10111111: SSEG_AN <= 8'b01111111;
        8'b01111111: SSEG_AN <= 8'b11111110;
        default:     SSEG_AN <= 8'b11111110;
    endcase
end

endmodule


module slow_clock(CLK, clk_slow); 
    input CLK;
    output clk_slow;
    
 reg [31:0] counter_out;
 reg clk_slow;
 
initial
    begin 
        counter_out<=32'h00000000;
        clk_slow<=0;
    end
always @(posedge CLK) 
    begin 
        counter_out<=counter_out + 32'h00000001; 
        if (counter_out>32'h00F5E100) 
        begin
            counter_out<=32'h00000000; 
            clk_slow<=!clk_slow;
        end
    end 
endmodule