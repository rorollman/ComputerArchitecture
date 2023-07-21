module fullhalfsub_4b (input [3:0] a,b, input cin, output borrow, output [3:0] diff);
	wire [4:0] x;

	fullsub fs1(a[0], b[0], cin, x[0], diff[0]);
	fullsub fs2(a[1], b[1], x[0], x[1], diff[1]);
	fullsub fs3(a[2], b[2], x[1], x[2], diff[2]);
	fullsub fs4(a[3], b[3], x[2], x[3], diff[3]);

	assign borrow = x[3];
	
endmodule

module fullsub(input a, b, cin, output borrow, diff);
	wire diff_half, borrow_half1, borrow_half2;
	
	halfsub hs1 (a, b, borrow_half1, diff_half);
	halfsub hs2 (diff_half, cin, borrow_half2, diff);
	or or1 (borrow, borrow_half1, borrow_half2);
endmodule

module halfsub(input a, b, output borrow, diff);
	xor xor1(diff, a, b);
	and and1(borrow, ~a, b);
endmodule
