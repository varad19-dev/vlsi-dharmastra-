module async_counter_3bit (
    input  wire clk,
    input  wire rst,
    output wire [2:0] q
);
    reg q0, q1, q2;

    // Stage 0 - toggles on every rising edge of the external clock
    always @(posedge clk or posedge rst) begin
        if (rst) q0 <= 1'b0;
        else     q0 <= ~q0;
    end

    // Stage 1 - clocked by Q0 (ripple connection)
    always @(posedge q0 or posedge rst) begin
        if (rst) q1 <= 1'b0;
        else     q1 <= ~q1;
    end

    // Stage 2 - clocked by Q1 (ripple connection)
    always @(posedge q1 or posedge rst) begin
        if (rst) q2 <= 1'b0;
        else     q2 <= ~q2;
    end

    assign q = {q2, q1, q0};
endmodule
