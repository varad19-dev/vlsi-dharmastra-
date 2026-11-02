`timescale 1ns/1ps

module sync_updown_counter_tb;
    reg  clk, rst, up_down;
    wire [2:0] q;

    sync_updown_counter uut (.clk(clk), .rst(rst), .up_down(up_down), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;       // 10 ns clock period

    initial begin
        rst = 1; up_down = 1;
        #12 rst = 0;

        up_down = 1;  #80;      // count UP for 8 clocks  : 000 -> 111
        up_down = 0;  #80;      // count DOWN for 8 clocks: 111 -> 000

        $display("3-bit Synchronous Up/Down Counter simulation completed");
        $finish;
    end

    initial $monitor("t=%0t rst=%b up_down=%b q=%b (%0d)",
                     $time, rst, up_down, q, q);
endmodule
