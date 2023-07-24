module mult_8b(input [7:0] a, b, output [15:0] prod);
	wire [7:0] m [7:0];
	
	wire [15:0] s [6:0];
	
	genvar j;
	generate
		for(j=0; j<8; j = j+1) begin
			assign m[j] = {8{a[j]}}&b[7:0];
		end
	endgenerate
	assign s[0] = m[0] + (m[1]<<1);
	generate
		for(j=1; j<7; j = j+1) begin
			assign s[j] = s[j-1] + (m[j+1]<<(j+1));
		end
	endgenerate
	assign prod = s[6];
endmodule