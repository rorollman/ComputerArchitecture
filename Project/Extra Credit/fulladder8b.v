module fulladder_4b (input [7:0] a, b, input cin, output carry, output [7:0] sum);
	wire [8:0] x;

	fulladder fa1(a[0], b[0], cin, x[0], sum[0]);
	fulladder fa2(a[1], b[1], x[0], x[1], sum[1]);
	fulladder fa3(a[2], b[2], x[1], x[2], sum[2]);
	fulladder fa4(a[3], b[3], x[2], x[3], sum[3]);
	fulladder fa1(a[4], b[4], x[3], x[4], sum[4]);
	fulladder fa2(a[5], b[5], x[4], x[5], sum[5]);
	fulladder fa3(a[6], b[6], x[5], x[6], sum[6]);
	fulladder fa4(a[7], b[7], x[6], x[7], sum[7]);
	
	assign carry = x[7];
endmodule

module fulladder (input a, b, cin, output carry, sum);
	assign sum = a^b^cin;
	assign carry = (a & b) | ((a^b)&cin);
endmodule
