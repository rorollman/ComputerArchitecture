module div_8b (dividend, divisor, start, clk, quot, rem, ready);

input [7:0] dividend;
input [7:0] divisor;
input start, clk;
 
output [7:0] quot;
output [7:0] rem;
output ready;

reg [7:0] quot;
reg [15:0] dividendcopy, divisorcopy, diff;
wire [7:0] rem = dividendcopy[7:0];
reg [8:0] bit;
wire ready = !bit;

initial bit = 0;

always @(posedge clk)
begin
	if(ready&&start) begin
		bit = 8;
		quot = 0;
		dividendcopy = {8'd0,dividend};
		divisorcopy = {1'b0,divisor,7'd0};
	end 
	else begin
		diff = dividendcopy - divisorcopy;
        	quot = { quot[6:0], ~diff[15] };
        	divisorcopy = { 1'b0, divisorcopy[15:1] };
        	if ( !diff[15] ) dividendcopy = diff;
        	bit = bit - 1;
	end
end
endmodule
