module fulladder_16b_test;
reg [31:0] a, b;
wire [31:0] sum;
wire carry;
integer i;

fulladder_32b a0 (.a (a), .b (b), .carry (carry), .sum (sum));

initial begin
	a <= 0;
	b <= 0;
	
	//this section loops ten times to create random test cases

	for (i = 0; i < 10; i = i + 1) begin
		#10 a <= $random;
		    b <= $random;
	end
end
initial begin
	$monitor ("%t | a=%b | b=%b | sum=%b | carry=%b", $time, a, b, 
sum, carry);
	$dumpfile("fulladder_32b.vcd");
	$dumpvars();
	$display("\t\ttime");
end
endmodule

