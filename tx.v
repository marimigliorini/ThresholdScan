 module tx

#(parameter clk_per_bit = 434) //...........(clk_freq)/(baud_rate)
//														  50MHz clock and 115200 baud => 434
(	
	input 		 clock,
	input 		 tx_en,
	input  [63:0] tx_byte,
	output reg	 tx_act,
	output reg	 tx_done,
	output reg	 tx_serial
);


reg [2:0 ] status   	  = 3'b000;
reg [8:0 ] clk_count	  = 9'd0;
reg [2:0 ] bit_index   = 3'd0;
reg [63:0] tx_data	  = 64'd0;


always @ (posedge clock) begin


	case (status)
		3'b000: //.............................Idle
			begin
				tx_serial  <= 1'b1;
				tx_act	  <= 1'b0;
				tx_done	   = 1'b0;
				
				if(~tx_en) begin
					tx_act  <= 1'b1;
					tx_data <= tx_byte;
					status  <= 3'b001 ;
				end
				else
					status  <= 3'b000;
			end
			
			
		3'b001: //.............................Start bit
			begin
				tx_serial    <= 1'b0;
				
				if(clk_count < clk_per_bit-1) begin
					clk_count <= clk_count + 1;
					status	 <= 3'b001;
				end
				else begin
					clk_count <= 0;
					status 	 <= 3'b010;
				end
			end
			
		
		3'b010: //............................Transmitting data
			begin
				tx_serial    <= tx_data[bit_index];
				
				if(clk_count < clk_per_bit-1) begin
					clk_count <= clk_count + 1;
					status	 <= 3'b010;
				end
				else begin
					clk_count <= 0;
					
					if(bit_index < 7) begin
						bit_index <= bit_index + 1;
						status	 <= 3'b010;
					end
					else begin
						bit_index <= 0;
						status    <= 3'b011;
					end
				end
			end
			
			
		3'b011: //.............................Stop bit
			begin
				tx_serial    <= 1'b1;
				
				if(clk_count < clk_per_bit-1) begin
					clk_count <= clk_count + 1;
					status	 <= 3'b011;
				end
				else begin
					tx_data <= (tx_data >> 64'd8);
					tx_done   <= 1'b1;
					clk_count <= 9'd0;
					tx_act    <= 1'b0;
					status    <= 3'b100;
				end
			end
			
			
		3'b100: //.............................Hold on
			begin
				if(tx_data == 64'd0)
					status  <= 3'b101;
				else
					status  <= 3'b001;
			end
			
		3'b101: //.............................Back to idle
			begin
				tx_done <= 1'b0;
				status <= 3'b000;
			end
	
	endcase


end

endmodule 