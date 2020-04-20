module my_reg
(
	input      [31:0] in,
	input             clk,
	input					rst,
	//input 				wr,
	output reg [31:0]	out

);


always @ (posedge clk) begin

		if (~rst)
			out <= in;
		else
			out <= 32'd0;
			
end

endmodule 