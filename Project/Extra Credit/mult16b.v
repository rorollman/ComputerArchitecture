module mult_16b(input [15:0] a, b, output [31:0] prod);
	wire [15:0] m [15:0];
	
	wire [31:0] s [14:0];
	
	genvar j;
	generate
		for(j=0; j<16; j = j+1) begin
			assign m[j] = {16{a[j]}}&b[15:0];
		end
	endgenerate
	assign s[0] = m[0] + (m[1]<<1);
	generate
		for(j=1; j<15; j = j+1) begin
			assign s[j] = s[j-1] + (m[j+1]<<(j+1));
		end
	endgenerate
	assign prod = s[14];
endmodule