module contador
(
	input  clock,
	input  clk,
	input	 enb,
	input  rst,
	output reg[63:0] out = 64'd0
);

reg reset;
/*
always @ (posedge clock) begin
	if(~rst)
		reset <= 1'b0;
	
	if(out == 0)
		reset <= 1'b1;
end
*/
always @ (posedge clk or negedge rst) begin
		
	if(~rst) begin
		out   <= 64'd0;
	end
	else begin
		if(enb)
			out <= out + 64'd1;
		else
			out <= out;
	end

end

endmodule 