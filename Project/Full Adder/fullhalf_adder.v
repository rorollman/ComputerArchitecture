module fullhalfadder_4b(input [3:0] a, b, input cin, output carry, output [3:0] sum);
	wire [4:0] x;
	
	fullhalf_adder fa1(a[0], b[0], cin, x[0], sum[0]);
	fullhalf_adder fa2(a[1], b[1], x[0], x[1], sum[1]);
	fullhalf_adder fa3(a[2], b[2], x[1], x[2], sum[2]);
	fullhalf_adder fa4(a[3], b[3], x[2], x[3], sum[3]);
	
	assign carry = x[3];

endmodule

module fullhalf_adder(input a, b, cin, output carry, output sum);
	wire sum_half, carry_half1, carry_half2;

	halfadder ha1 (a, b, carry_half1, sum_half);
	halfadder ha2 (sum_half, cin, carry_half2, sum);
	or or1 (carry, carry_half1, carry_half2);
endmodule

module halfadder(input a, b, output carry, output sum);
	xor xor1 (sum, a, b);
	and and1 (carry, a, b);
endmodule

