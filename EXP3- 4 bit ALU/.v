module alu_4bit(
    input  wire [3:0] A, B,
    input  wire [2:0] ALU_Sel,
    input  wire       Cin,
    output reg  [3:0] Result,
    output reg        Zero, Carry, Negative
);
    reg [4:0] temp;   // 5-bit to capture carry

    always @(*) begin
        temp = 5'b0;
        case (ALU_Sel)
            3'b000: temp = A + B + Cin;      // ADD
            3'b001: temp = A - B;            // SUB
            3'b010: temp = A + 4'b0001;      // INC
            3'b011: temp = A - 4'b0001;      // DEC
            3'b100: temp = A & B;            // AND
            3'b101: temp = A | B;            // OR
            3'b110: temp = A ^ B;            // XOR
            3'b111: temp = ~A;               // NOT
            default: temp = 5'b0;
        endcase

        Result   = temp[3:0];
        Carry    = temp[4];
        Zero     = (Result == 4'b0000);
        Negative = Result[3];
    end
endmodule
