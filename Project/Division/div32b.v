module div_32b (dividend, divisor, start, clk, quot, rem, ready);

input [31:0] dividend;
input [31:0] divisor;
input start, clk;
 
output [31:0] quot;
output [31:0] rem;
output ready;

reg [31:0] quot;
reg [63:0] dividendcopy, divisorcopy, diff;
wire [31:0] rem = dividendcopy[31:0];
reg [32:0] bit;
wire ready = !bit;

initial bit = 0;

always @(posedge clk)
begin
	if(ready&&start) begin
		bit = 32;
		quot = 0;
		dividendcopy = {32'd0,dividend};
		divisorcopy = {1'b0,divisor,31'd0};
	end 
	else begin
		diff = dividendcopy - divisorcopy;
        	quot = { quot[30:0], ~diff[63] };
        	divisorcopy = { 1'b0, divisorcopy[63:1] };
        	if ( !diff[63] ) dividendcopy = diff;
        	bit = bit - 1;
	end
end
endmodule