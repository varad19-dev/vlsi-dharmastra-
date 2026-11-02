module sync_updown_counter (
    input  wire clk,
    input  wire rst,
    input  wire up_down,    // 1 = count up, 0 = count down
    output reg  [2:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 3'b000;
        else if (up_down)
            q <= q + 1'b1;   // synchronous increment
        else
            q <= q - 1'b1;   // synchronous decrement
    end
endmodule
