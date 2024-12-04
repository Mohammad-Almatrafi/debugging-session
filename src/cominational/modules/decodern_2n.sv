module decodern_2n #(
    parameter n = 2
) (
    i,
    en,
    out
);

  input [n-1:0] i;
  input en;
  output logic [2**n-1:0] out;

  always @(i, en) begin
    out = 'b0;
    if (en) begin
      out[i] = 1'b1;
    end
  end
endmodule
