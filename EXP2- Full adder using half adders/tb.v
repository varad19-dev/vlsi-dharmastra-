`timescale 1ns/1ps

module tb_full_adder;
    reg A, B, Cin;
    wire Sum, Cout;

    full_adder uut(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    integer i;

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, tb_full_adder);

        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #10;
        end

        $finish;
    end

    initial $monitor("t=%0t A=%b B=%b Cin=%b | Sum=%b Cout=%b",
                     $time, A, B, Cin, Sum, Cout);
endmodule
