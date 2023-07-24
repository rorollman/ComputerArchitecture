module mult_test;
reg [15:0] a, b;
wire [31:0] prod;
integer i;

mult_16b m0(.a (a), .b (b), .prod (prod));

initial begin
	a <= 0;
	b <= 0;
	
	//this section loops ten times to create random test cases
	for (i = 0; i < 5; i = i + 1) begin
		#10 a <= $random;
		    b <= $random;
	end
end
initial begin
	$monitor ("%t | a = %b | b = %b | prod = %b", $time, a, b, prod);
	$dumpfile("mult16b.vcd");
	$dumpvars();
	$display("\t\ttime");
end
endmodule
