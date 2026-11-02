`timescale 1ns/1ps

module ring_counter_4bit_tb;
    reg  clk, rst;
    wire [3:0] q;

    ring_counter_4bit uut (.clk(clk), .rst(rst), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;       // 10 ns clock period

    initial begin
        $dumpfile("ring_counter_4bit.vcd");
        $dumpvars(0, ring_counter_4bit_tb);

        rst = 1;
        #12 rst = 0;
        #160;                   // run for 16 clock cycles
        $display("4-bit Ring Counter simulation completed");
        $finish;
    end

    initial $monitor("time=%0t rst=%b q=%b", $time, rst, q);
endmodule
