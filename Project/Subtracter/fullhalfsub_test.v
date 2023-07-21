module fullsub_test;
reg [3:0] a, b;
reg cin;
wire [3:0] diff;
wire borrow;
integer i;

fullhalfsub_4b s0 (.a (a), .b (b), .cin (cin), .borrow (borrow), .diff (diff));

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
	end
end
initial begin
	$monitor ("%t | a=%b | b=%b | cin=%b | diff=%b | borrow=%b", $time, a, b, cin, diff, borrow);
	$dumpfile("fullhalfsub.vcd");
	$dumpvars();
	$display("\t\ttime");
end
endmodule

