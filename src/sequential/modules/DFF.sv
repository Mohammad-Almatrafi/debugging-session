module DFF (
    clk,
    rst_n,
    en,
    d,
    q
);

  input clk, rst_n, en, d;

  output logic q;

  always @(posedge clk, negedge rst_n) begin
    if (~rst_n) q <= 'b0;
    else if (en) q <= d;

  end

endmodule
