module bin_to_gray(
    input  wire [3:0] B,   // 4-bit binary input
    output wire [3:0] G    // 4-bit Gray code output
);
    // MSB remains the same
    assign G[3] = B[3];

    // Remaining bits: XOR adjacent binary bits
    assign G[2] = B[3] ^ B[2];
    assign G[1] = B[2] ^ B[1];
    assign G[0] = B[1] ^ B[0];

    // Equivalent compact form:
    // assign G = B ^ (B >> 1);
endmodule
