module timer
#(
	parameter T = 25'd24999999
)
(
	input  clock,
	input  enable,
	output seg
);

reg y;
reg [24:0] g = 25'd0;

assign seg = y;

reg q = 1'b0;

always @ (posedge clock) begin

	if (enable) begin
		if (g < T)
			g = g + 25'd1;
		else
			g = 25'd0;
			
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
	
end

always @ (*) begin
	case (q)
		1'b0: y = 1'b1;
		1'b1: y = 1'b0;
	endcase
end

endmodule 