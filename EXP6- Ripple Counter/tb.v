`timescale 1ns/1ps

module async_counter_3bit_tb;
    reg  clk, rst;
    wire [2:0] q;

    async_counter_3bit uut (.clk(clk), .rst(rst), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;     // 10 ns clock period

    initial begin
        rst = 1;
        #12 rst = 0;
        #160;                 // run for 16 clock cycles
        $display("3-bit Asynchronous Counter simulation completed");
        $finish;
    end

    initial
        $monitor("t=%0t rst=%b q=%b (%0d)", $time, rst, q, q);
endmodule
