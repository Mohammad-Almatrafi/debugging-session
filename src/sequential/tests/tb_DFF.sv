module tb_DFF;

  logic clk = 0, rst_n, en, d, q;


  DFF DUT (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .d(d),
      .q(q)
  );

  always #5 clk = ~clk;

  initial begin
    rst_n = 1;
    #1;
    rst_n = 0;
    #1;
    rst_n = 1;

    d = 0;
    en = 0;

    repeat (4) begin
      @(negedge clk);
      d = ~d;
    end

    en = 1;
    repeat (4) begin
      @(negedge clk);
      d = ~d;
    end
    $finish;

  end


endmodule
