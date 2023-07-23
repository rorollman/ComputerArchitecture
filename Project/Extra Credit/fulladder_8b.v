module fulladder_8b (input [7:0] a, b, output carry, output [7:0] sum);
	wire [7:0] x;
	reg cin =0;

	genvar i;
	fulladder fa(a[0], b[0], cin, x[0], sum[0]);
	generate
		for (i=1; i<8; i = i+1) begin
			fulladder fa(a[i], b[i], x[i-1], x[i], sum[i]);
		end
	endgenerate
	assign carry = x[7];
endmodule

module fulladder (input a, b, cin, output carry, sum);
	assign sum = a^b^cin;
	assign carry = (a & b) | ((a^b)&cin);
endmodule
