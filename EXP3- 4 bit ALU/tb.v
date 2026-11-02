`timescale 1ns/1ps

module tb_alu_4bit;
    reg  [3:0] A, B;
    reg  [2:0] ALU_Sel;
    reg        Cin;
    wire [3:0] Result;
    wire       Zero, Carry, Negative;

    alu_4bit uut(
        .A(A), .B(B), .ALU_Sel(ALU_Sel),
        .Cin(Cin), .Result(Result),
        .Zero(Zero), .Carry(Carry), .Negative(Negative)
    );

    initial begin
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, tb_alu_4bit);

        A = 4'h5; B = 4'h3; Cin = 0;

        ALU_Sel = 3'b000; #10;   // ADD: 5+3=8
        ALU_Sel = 3'b001; #10;   // SUB: 5-3=2
        ALU_Sel = 3'b010; #10;   // INC: 5+1=6
        ALU_Sel = 3'b011; #10;   // DEC: 5-1=4
        ALU_Sel = 3'b100; #10;   // AND: 5&3=1
        ALU_Sel = 3'b101; #10;   // OR:  5|3=7
        ALU_Sel = 3'b110; #10;   // XOR: 5^3=6
        ALU_Sel = 3'b111; #10;   // NOT: ~5=A

        
        A = 4'hF; B = 4'h1; ALU_Sel = 3'b000; #10;   

        $finish;
    end

    initial $monitor("t=%0t Sel=%b A=%h B=%h | Res=%h Z=%b C=%b N=%b",
                     $time, ALU_Sel, A, B, Result, Zero, Carry, Negative);
endmodule
