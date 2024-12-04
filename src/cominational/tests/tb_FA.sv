module tb_FA;

  logic a, b, cin, cout, sum;

  FA DUT (
      .a(a),
      .b(b),
      .cin(cin),
      .cout(cout),
      .sum(sum)
  );

  initial begin
    for (int i = 0; i < 2 ** 3; i++) begin
      {a, b, cin} = i;
      #5;
      $display("%d", {cout, sum} == a + b + cin);
    end

    $finish;
  end

endmodule
