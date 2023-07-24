module mult_test;
reg [31:0] a, b;
wire [63:0] prod;
integer i;

mult_32b m0(.a (a), .b (b), .prod (prod));

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
	$monitor ("%t \n a = %b \n b = %b \n prod = %b", $time, a, b, prod);
	$dumpfile("mult32b.vcd");
	$dumpvars();
	$display("\t\ttime");
end
endmodule
