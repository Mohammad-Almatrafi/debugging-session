module FA (
    a,
    b,
    cin,
    cout,
    sum
);
  input logic a, b, cin;
  output logic cout, sum;
  //   assign sum  = a ^ b ^ cin;
  //   assign cout = a & b | a & cin | b & cin;


  always @(*) begin
    {cout, sum} = a + b + cin;


  end

endmodule
