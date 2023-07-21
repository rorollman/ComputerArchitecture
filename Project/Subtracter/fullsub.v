module fullsub_4b (input [3:0] a,b, input cin, output borrow, output [3:0] diff);
	wire [4:0] x;

	fullsub fs1(a[0], b[0], cin, x[0], diff[0]);
	fullsub fs2(a[1], b[1], x[0], x[1], diff[1]);
	fullsub fs3(a[2], b[2], x[1], x[2], diff[2]);
	fullsub fs4(a[3], b[3], x[2], x[3], diff[3]);

	assign borrow = x[3];
	
endmodule

module fullsub (input a, b, cin, output borrow, diff);
	assign diff = a^b^cin;
	assign borrow = (~a & b) | (~(a^b)&cin);
endmodule
