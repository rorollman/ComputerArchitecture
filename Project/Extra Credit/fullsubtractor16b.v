module fullsub_4b (input [15:0] a,b, input cin, output borrow, output [15:0] diff);
  wire [16:0] x;

	fullsub fs1(a[0], b[0], cin, x[0], diff[0]);
	fullsub fs2(a[1], b[1], x[0], x[1], diff[1]);
	fullsub fs3(a[2], b[2], x[1], x[2], diff[2]);
	fullsub fs4(a[3], b[3], x[2], x[3], diff[3]);
  fullsub fs1(a[4], b[4], x[3], x[4], diff[4]);
  fullsub fs2(a[5], b[5], x[4], x[5], diff[5]);
  fullsub fs3(a[6], b[6], x[5], x[6], diff[6]);
  fullsub fs4(a[7], b[7], x[6], x[7], diff[7]);
  fullsub fs1(a[8], b[8], x[7], x[8], diff[8]);
  fullsub fs2(a[9], b[9], x[8], x[9], diff[9]);
  fullsub fs3(a[10], b[10], x[9], x[10], diff[10]);
  fullsub fs4(a[11], b[11], x[10], x[11], diff[11]);
  fullsub fs1(a[12], b[12], x[11], x[12], diff[12]);
  fullsub fs2(a[13], b[13], x[12], x[13], diff[13]);
  fullsub fs3(a[14], b[14], x[13], x[14], diff[14]);
  fullsub fs4(a[15], b[15], x[14], x[15], diff[15]);



  assign borrow = x[15];
	
endmodule

module fullsub (input a, b, cin, output borrow, diff);
	assign diff = a^b^cin;
	assign borrow = (~a & b) | (~(a^b)&cin);
endmodule
