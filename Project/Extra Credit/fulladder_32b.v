module fulladder_32b (input [31:0] a, b, output carry, output [31:0] sum);
	wire [31:0] x;
	reg cin =0;

	genvar i;
	fulladder fa(a[0], b[0], cin, x[0], sum[0]);
	generate
		for (i=1; i<32; i = i+1) begin
			fulladder fa(a[i], b[i], x[i-1], x[i], sum[i]);
		end
	endgenerate
	assign carry = x[31];
endmodule

module fulladder (input a, b, cin, output carry, sum);
	assign sum = a^b^cin;
	assign carry = (a & b) | ((a^b)&cin);
endmodule

