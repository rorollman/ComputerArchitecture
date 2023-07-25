module div_4b (dividend, divisor, start, clk, quot, rem, ready);

input [3:0] dividend;
input [3:0] divisor;
input start, clk;
 
output [3:0] quot;
output [3:0] rem;
output ready;

reg [3:0] quot;
reg [7:0] dividendcopy, divisorcopy, diff;
wire [3:0] rem = dividendcopy[3:0];
reg [4:0] bit;
wire ready = !bit;

initial bit = 0;

always @(posedge clk)
begin
	if(ready&&start) begin
		bit = 4;
		quot = 0;
		dividendcopy = {4'd0,dividend};
		divisorcopy = {1'b0,divisor,3'd0};
	end 
	else begin
		diff = dividendcopy - divisorcopy;
        	quot = { quot[2:0], ~diff[7] };
        	divisorcopy = { 1'b0, divisorcopy[7:1] };
        	if ( !diff[7] ) dividendcopy = diff;
        	bit = bit - 1;
	end
end
endmodule




/*
//copy variables
	reg [3:0] ac, bc, temp;
	integer j;

	always @(a or b) begin
	ac = a;
	bc = b;
	temp = 0;
	for(j=0; j<4; j = j+1) begin
		temp = {temp[2:0], bc[3]};
		bc[3:1] = bc[2:0];
		temp = temp-bc;
		if (temp[3]==1) begin
			bc[0] = 0;
			temp = temp + ac;
		end
		else begin
			bc[0] = 1;
		end
	end
	quot = bc;
	rem = b - (ac*bc);
	end
endmodule
*/