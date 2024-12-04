module tb_counter_4bit;

  logic clk = 0, en, load, rst_n, up_down;
  logic [3:0] d, q;


  counter_4bit DUT (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .up_down(up_down),
      .load(load),
      .d(d),
      .q(q)
  );
  always #5 clk = ~clk;


  initial begin
    rst_n = 1;
    d = 'b0;
    load = 0;
    en = 0;
    up_down = 0;
    #1 rst_n = 0;
    #1 rst_n = 1;



    repeat (18) begin
      @(negedge clk);
    end

    en = 1;

    d = 'b1;
    load = 1'b0;
    up_down = 1'b0;


    repeat (18) begin
      @(negedge clk);
    end

    d = 'b0;
    load = 1'b0;
    up_down = 1'b1;

    repeat (15) begin
      @(negedge clk);
    end

    d = 'd5;
    load = 1'b1;
    up_down = 1'b1;

    repeat (6) begin
      @(negedge clk);
      d = d + 5;
    end

    $finish;
  end

endmodule
