`timescale 1ns/1ps

module tb_bin_to_gray;
    reg  [3:0] B;
    wire [3:0] G;

    bin_to_gray uut (.B(B), .G(G));

    integer i;

    initial begin
        $dumpfile("bin_to_gray.vcd");
        $dumpvars(0, tb_bin_to_gray);

        for (i = 0; i < 16; i = i + 1) begin
            B = i;
            #10;
        end

        $finish;
    end

    initial $monitor("t=%3t ns | Binary=%b (%2d) | Gray=%b",
                     $time, B, B, G);
endmodule
