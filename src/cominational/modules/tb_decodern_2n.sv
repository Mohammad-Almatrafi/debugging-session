module tb_decodern_2n;
  localparam n = 3;
  logic [n-1:0] i;
  logic [2**n-1:0] out;
  logic en;


  decodern_2n #(
      .n(n)
  ) DUT (
      .i  (i),
      .en (en),
      .out(out)
  );

  initial begin
    i  = 0;
    en = 0;
    repeat (16) begin
      #5;
      {en, i} = {en, i} + 1;
    end
    $finish;
  end



endmodule
