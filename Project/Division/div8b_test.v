module div_test;
wire [7:0] quot, rem;
reg [7:0]  shadow_quot, shadow_rem;
reg [7:0]  a, b;
integer    i;

reg clk;
initial clk = 0;
always #1 clk = ~clk;

reg start;
wire ready;

wire [7:0] infinity;
assign infinity = 16'hffff;

div_8b d8(a,b,start, clk, quot, rem, ready);

initial begin
	# 1;
      	while (!ready) #1;
      		for (i=0; i<10; i=i+1) begin:A
         		integer shadow_quot, shadow_rem;
			a = $random;
         		b = i & 1 ? $random : $random & 3;
         		start = 1;

        		while (ready) #1;
			start = 0;
			while (!ready) #1;

         		shadow_quot = b ? a / b : infinity;
         		shadow_rem  = b ? a % b : a;

        		$display("%t | a = %b | b = %b | quot = %b | rem = %b", $time, a, b, quot, rem);
		end
	$stop;
end
initial begin
	//$monitor ("%t | a = %b | b = %b | quot = %b | rem = %b", $time, a, b, quot, rem);
	$dumpfile("div8b.vcd");
	$dumpvars();
	$display("\t\ttime");
end
endmodule
		
