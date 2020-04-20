module bcd
(
	input [3:0] in,
	output reg a, b, c, d, e, f, g
);

always @(*) begin
	case (in)
		4'd0: begin 
					a = 1'b0;
					b = 1'b0; 
					c = 1'b0;
					d = 1'b0;
					e = 1'b0;
					f = 1'b0;
					g = 1'b1;
				end
		4'd1: begin 
					a = 1'b1;
					b = 1'b0; 
					c = 1'b0;
					d = 1'b1;
					e = 1'b1;
					f = 1'b1;
					g = 1'b1;
				end
		4'd2: begin 
					a = 1'b0;
					b = 1'b0; 
					c = 1'b1;
					d = 1'b0;
					e = 1'b0;
					f = 1'b1;
					g = 1'b0;
				end
		4'd3: begin 
					a = 1'b0;
					b = 1'b0; 
					c = 1'b0;
					d = 1'b0;
					e = 1'b1;
					f = 1'b1;
					g = 1'b0;
				end
		4'd4: begin 
					a = 1'b1;
					b = 1'b0; 
					c = 1'b0;
					d = 1'b1;
					e = 1'b1;
					f = 1'b0;
					g = 1'b0;
				end
		4'd5: begin 
					a = 1'b0;
					b = 1'b1; 
					c = 1'b0;
					d = 1'b0;
					e = 1'b1;
					f = 1'b0;
					g = 1'b0;
				end
		4'd6: begin 
					a = 1'b0;
					b = 1'b1; 
					c = 1'b0;
					d = 1'b0;
					e = 1'b0;
					f = 1'b0;
					g = 1'b0;
				end
		4'd7: begin 
					a = 1'b0;
					b = 1'b0; 
					c = 1'b0;
					d = 1'b1;
					e = 1'b1;
					f = 1'b1;
					g = 1'b1;
				end
		4'd8: begin 
					a = 1'b0;
					b = 1'b0; 
					c = 1'b0;
					d = 1'b0;
					e = 1'b0;
					f = 1'b0;
					g = 1'b0;
				end
		4'd9: begin 
					a = 1'b0;
					b = 1'b0; 
					c = 1'b0;
					d = 1'b1;
					e = 1'b1;
					f = 1'b0;
					g = 1'b0;
				end
		default: begin 
					a = 1'bx;
					b = 1'bx; 
					c = 1'bx;
					d = 1'bx;
					e = 1'bx;
					f = 1'bx;
					g = 1'bx;
				end
	endcase
end

endmodule 