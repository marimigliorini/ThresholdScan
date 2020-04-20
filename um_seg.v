module um_seg
#(
	parameter T = 25'd24999999
)
(
	input  clk,
	output clk_out
);

reg y;
reg [24:0] g = 25'd0;

assign clk_out = y;

reg q = 1'b0;

always @ (posedge clk) begin
	case (q)
		1'b0: if(g < T)
					q <= 1'b0;
				else
					q <= 1'b1;
					
		1'b1: if(g < T)
					q <= 1'b1;
				else
					q <= 1'b0;
	endcase
end

always @ (*) begin
	case (q)
		1'b0: y = 1'b1;
		1'b1: y = 1'b0;
	endcase
end

always @ (posedge clk) begin
	if (g < T)
		g = g + 25'd1;
	else
		g = 25'd0;
end

endmodule
