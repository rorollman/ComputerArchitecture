module fulladder (input [3:0] a, b, input cin, output reg carry, output reg [3:0] sum);

	always @ (a or b or cin) begin
		{carry, sum} = a + b + cin;
	end
endmodule

//{carry, sum} = a + b + cin 
//calcs a+b+cin and assigns the sum to sum and the carry-out to carry, the curly brackets are used to concat. carry and sum into a single 4-bit vector



