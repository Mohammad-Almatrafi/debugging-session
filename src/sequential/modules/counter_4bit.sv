module counter_4bit (
    clk,
    rst_n,
    en,
    up_down,
    load,
    d,
    q
);

  input clk, rst_n, en, up_down, load;
  input [3:0] d;
  output [3:0] q;

  logic [3:0] next_up, next_down, w1, w2;

  assign next_up[0] = ~q[0];
  assign next_up[1] = q[1] ^ q[0];
  assign next_up[2] = (&q[1:0]) ^ q[2];
  assign next_up[3] = (&q[2:0]) ^ q[3];

  assign next_down[0] = ~q[0];
  assign next_down[1] = q[1] ^ ~q[0];
  assign next_down[2] = (&(~q[1:0])) ^ q[2];
  assign next_down[3] = (&(~q[2:0])) ^ q[3];

  assign w1 = up_down ? next_down : next_up;
  assign w2 = load ? d : w1;

  DFF dff1 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(w2[0]),
      .q(q[0])
  );

  DFF dff2 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(w2[1]),
      .q(q[1])
  );

  DFF dff3 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(w2[2]),
      .q(q[2])
  );

  DFF dff4 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(w2[3]),
      .q(q[3])
  );


endmodule
