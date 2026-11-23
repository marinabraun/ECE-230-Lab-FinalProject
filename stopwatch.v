//StopWatch: Modulo-60 Counter
module stopwatch(
    input clk,
    input rst,
    input en,
    output [5:0] state     //6-bits to represent the highest number 59
);

    wire T0, T1, T2, T3, T4, T5;
    wire S59;
    wire D0, D1, D2, D3, D4, D5;

    assign T0 = en;
    assign T1 = T0 & state[0];
    assign T2 = T1 & state[1];
    assign T3 = T2 & state[2];
    assign T4 = T3 & state[3];
    assign T5 = T4 & state[4];

    assign S59 = state[5] & state[4] & state[3] & state[1] & state[0];

    assign D0 = (S59 & en) ? 1'b0 : (state[0] ^ T0);
    assign D1 = (S59 & en) ? 1'b0 : (state[1] ^ T1);
    assign D2 = (S59 & en) ? 1'b0 : (state[2] ^ T2);
    assign D3 = (S59 & en) ? 1'b0 : (state[3] ^ T3);
    assign D4 = (S59 & en) ? 1'b0 : (state[4] ^ T4);
    assign D5 = (S59 & en) ? 1'b0 : (state[5] ^ T5);

    dff ff0(
        .d(D0),
        .clk(clk),
        .rst(rst),
        .q(state[0])
    );

    dff ff1(
        .d(D1),
        .clk(clk),
        .rst(rst),
        .q(state[1])
    );

    dff ff2(
        .d(D2),
        .clk(clk),
        .rst(rst),
        .q(state[2])
    );

    dff ff3(
        .d(D3),
        .clk(clk),
        .rst(rst),
        .q(state[3])
    );

    dff ff4(
        .d(D4),
        .clk(clk),
        .rst(rst),
        .q(state[4])
    );

    dff ff5(
        .d(D5),
        .clk(clk),
        .rst(rst),
        .q(state[5])
    );

endmodule




