  module control
(
	input			      clk      ,
	input			      i_Thr    ,
	input      [7:0]  o_Rx_Byte,
	input				   o_Rx_DV  ,
	input				   o_Tx_Done,
	output reg		   i_Tx_DV  ,
	output reg [63:0] o_cnt_Thr
	
);

reg en_cont = 1'b0;

wire		   tempo  ;
wire [ 7:0] cnt  	 ;
wire [63:0] cnt_Thr;

reg		  rst		;
reg  [1:0] clk_active = 2'b00;
reg  [1:0] status     = 2'b00;


always @ (posedge clk) begin

	case (status)
		
		2'b00:
			begin
				rst <= 1'b1;
				if(o_Rx_DV) begin
					i_Tx_DV <= 1'b1;
					status  <= 2'b00;
				end
				else
					status <= 2'b01;
			end
			
		2'b01:
			begin				
				en_cont   <= 1'b1;
				o_cnt_Thr <= cnt_Thr;
				//o_cnt_Thr <= cnt;
				
				if(cnt == o_Rx_Byte) begin
					en_cont <= 1'b0;
					clk_active <= clk_active + 1;
					if(clk_active == 3) begin
						i_Tx_DV    <= 1'b0;
						clk_active <= 2'b00;
						status     <= 2'b10;
					end
					else
						status <= 2'b01;
				end
				else
					status <= 2'b01;
			end
			
		2'b10:
			begin
				i_Tx_DV <= 1'b1;
				if(o_Tx_Done)
					rst <= 1'b0;
					
				if(~rst) begin
					clk_active <= clk_active + 1;
					if(clk_active == 2) begin
						clk_active <= 2'b00;
						status 	  <= 2'b00;
					end
					else
						status <= 2'b10;
				end
				else
					status <= 2'b10;
			end
	
	endcase 

end

timer    seg    (clk, en_cont, tempo);
contador cont   (clk, tempo, en_cont, rst, cnt);
contador thr	 (clk, i_Thr, en_cont, rst, cnt_Thr);

endmodule 