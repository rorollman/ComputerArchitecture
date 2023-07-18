module fullhalf_adder_test;
	reg [3:0] a, b;
	reg cin;
	wire [3:0] sum;
	wire carry;
	integer i;

	fulladder4b fa0(.a (a), .b (b), .cin (cin), .carry (carry), .sum (sum));

	initial begin
		a <= 0;
		b <= 0;
		cin <= 0;
		//this section loops ten times to create random test cases
		//the display portion displays the test case in binary and decimal (for checking purpose)
		for (i = 0; i < 10; i = i + 1) begin
			#10 a <= $random;
			    b <= $random;
				cin <= $random;
			$display("Decimal");
			$display ("a = %0d b = %0d cin = %0d carry = %0d sum = %0d", a, b, cin, carry, sum);
			$display("Binary");
			$display("a = %0b b = %0b cin = %0b carry = %0b sum = %0b", a, b, cin, carry, sum);
		end
	end

	initial begin
		$monitor ("%t | a=%b | b=%b | cin=%b | sum=%b | carry=%b", $time, a, b, cin, sum, carry);
		$dumpfile("fullhalf_adder.vcd");
		$dumpvars();
	end
endmodule
