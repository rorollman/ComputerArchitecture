module fulladder_4b (input [15:0] a, b, input cin, output carry, output [15:0] sum);
  wire [16:0] x;

	fulladder fa1(a[0], b[0], cin, x[0], sum[0]);
	fulladder fa2(a[1], b[1], x[0], x[1], sum[1]);
	fulladder fa3(a[2], b[2], x[1], x[2], sum[2]);
	fulladder fa4(a[3], b[3], x[2], x[3], sum[3]);
	fulladder fa1(a[4], b[4], x[3], x[4], sum[4]);
	fulladder fa2(a[5], b[5], x[4], x[5], sum[5]);
	fulladder fa3(a[6], b[6], x[5], x[6], sum[6]);
	fulladder fa4(a[7], b[7], x[6], x[7], sum[7]);
  fulladder fa1(a[8], b[8], x[7], x[8], sum[8]);
  fulladder fa2(a[9], b[9], x[8], x[9], sum[9]);
  fulladder fa3(a[10], b[10], x[9], x[10], sum[10]);
  fulladder fa4(a[11], b[11], x[10], x[11], sum[11]);
  fulladder fa1(a[12], b[12], x[11], x[12], sum[12]);
  fulladder fa2(a[13], b[13], x[12], x[13], sum[13]);
  fulladder fa3(a[14], b[14], x[13], x[14], sum[14]);
  fulladder fa4(a[15], b[15], x[14], x[15], sum[15]);
  assign carry = x[15];
endmodule

module fulladder (input a, b, cin, output carry, sum);
	assign sum = a^b^cin;
	assign carry = (a & b) | ((a^b)&cin);
endmodule
