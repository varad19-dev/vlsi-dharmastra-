`timescale 1ns/1ps

module jk_ff_tb;
    reg  clk, rst, j, k;
    wire q, qbar;

    jk_ff uut (.clk(clk), .rst(rst), .j(j), .k(k), .q(q), .qbar(qbar));

    // 10 ns clock period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; j = 0; k = 0;
        #12 rst = 0;

        j = 0; k = 0;  #10;   // Hold
        j = 0; k = 1;  #10;   // Reset
        j = 1; k = 0;  #10;   // Set
        j = 1; k = 1;  #10;   // Toggle
        j = 1; k = 1;  #10;   // Toggle again

        $display("JK Flip-Flop simulation completed");
        $finish;
    end

    initial
        $monitor("t=%0t rst=%b j=%b k=%b -> q=%b qbar=%b",
                 $time, rst, j, k, q, qbar);
endmodule
