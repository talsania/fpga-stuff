`timescale 1ns / 1ps

module tb_clk_divider;
    reg clk;
    reg rst;
    wire led;

    clk_divider uut (
        .clk(clk),
        .rst(rst),
        .led(led)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0;
        #1000;
        $stop;
    end

endmodule
