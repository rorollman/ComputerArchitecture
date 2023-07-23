module fulladder_16b (input [15:0] a, b, output carry, output [15:0] sum);
	wire [15:0] x;
	reg cin =0;

	genvar i;
	fulladder fa(a[0], b[0], cin, x[0], sum[0]);
	generate
		for (i=1; i<16; i = i+1) begin
			fulladder fa(a[i], b[i], x[i-1], x[i], sum[i]);
		end
	endgenerate
	assign carry = x[15];
endmodule

module fulladder (input a, b, cin, output carry, sum);
	assign sum = a^b^cin;
	assign carry = (a & b) | ((a^b)&cin);
endmodule

