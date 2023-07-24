module mult_32b(input [31:0] a, b, output [63:0] prod);
	wire [31:0] m [31:0];
	
	wire [63:0] s [30:0];
	
	genvar j;
	generate
		for(j=0; j<32; j = j+1) begin
			assign m[j] = {32{a[j]}}&b[31:0];
		end
	endgenerate
	assign s[0] = m[0] + (m[1]<<1);
	generate
		for(j=1; j<31; j = j+1) begin
			assign s[j] = s[j-1] + (m[j+1]<<(j+1));
		end
	endgenerate
	assign prod = s[30];
endmodule