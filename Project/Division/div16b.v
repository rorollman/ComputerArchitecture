module div_16b (dividend, divisor, start, clk, quot, rem, ready);

input [15:0] dividend;
input [15:0] divisor;
input start, clk;
 
output [15:0] quot;
output [15:0] rem;
output ready;

reg [15:0] quot;
reg [31:0] dividendcopy, divisorcopy, diff;
wire [15:0] rem = dividendcopy[15:0];
reg [16:0] bit;
wire ready = !bit;

initial bit = 0;

always @(posedge clk)
begin
	if(ready&&start) begin
		bit = 16;
		quot = 0;
		dividendcopy = {16'd0,dividend};
		divisorcopy = {1'b0,divisor,15'd0};
	end 
	else begin
		diff = dividendcopy - divisorcopy;
        	quot = { quot[14:0], ~diff[31] };
        	divisorcopy = { 1'b0, divisorcopy[31:1] };
        	if ( !diff[31] ) dividendcopy = diff;
        	bit = bit - 1;
	end
end
endmodule