module fulladder (a, b, cin, carry, sum);
	input [3:0] a, b;
	input cin;
	output [3:0] sum;
	output carry;

	assign {carry, sum} = a + b + cin;
endmodule

//{carry, sum} = a + b + cin 
//calcs a+b+cin and assigns the sum to sum and the carry-out to carry, the curly brackets are used to concat. Carry and sum into a single 4-bit vector



