module ThrAdj
(
	input  		 i_Thr,
	input  		 i_Clock,
	input			 i_Rx_Serial,
	output       o_Tx_Active,
   output       o_Tx_Serial,
   output       o_Tx_Done,
	output       o_Rx_Active,
	
	
	input      enable,
	output reg o_Thr,
	
	output outdMM0, outdMM1, outdMM2, outdMM3, outdMM4, outdMM5, outdMM6,
	output outMM0, outMM1, outMM2, outMM3, outMM4, outMM5, outMM6,	
	output outcM0, outcM1, outcM2, outcM3, outcM4, outcM5, outcM6,
	output outdM0, outdM1, outdM2, outdM3, outdM4, outdM5, outdM6,
	output outM0, outM1, outM2, outM3, outM4, outM5, outM6,
	output outC0, outC1, outC2, outC3, outC4, outC5, outC6,
	output outD0, outD1, outD2, outD3, outD4, outD5, outD6,
	output outU0, outU1, outU2, outU3, outU4, outU5, outU6
);

wire		   sec      ;
wire		   o_Rx_DV  ;
wire [63:0] cnt_Thr  ;
wire [7:0 ] o_Rx_Byte;

wire [63:0] out_cnt_Thr;
wire [3:0 ] dmilhao, milhao, cmilhar, dmilhar, milhar, centena, dezena, unidade;


control 	ctrl	 (i_Clock, i_Thr, o_Rx_Byte, o_Rx_DV, o_Tx_Done, i_Tx_DV, cnt_Thr);

uart_rx 	uartRx (i_Clock, i_Rx_Serial, o_Rx_DV, o_Rx_Byte, o_Rx_Active); 
tx       uartTx (i_Clock, i_Tx_DV, cnt_Thr, o_Tx_Active, o_Tx_Done, o_Tx_Serial);

my_reg	reg_out (cnt_Thr, i_Clock, enable, out_cnt_Thr);

dec9999  value  (out_cnt_Thr, dmilhao, milhao, cmilhar, dmilhar, milhar, centena, dezena, unidade);


bcd		bcd0	 (dmilhar, outdM0, outdM1, outdM2, outdM3, outdM4, outdM5, outdM6);
bcd		bcd1	 (milhar,  outM0, outM1, outM2, outM3, outM4, outM5, outM6);
bcd 		bcd2	 (centena, outC0, outC1, outC2, outC3, outC4, outC5, outC6);
bcd 		bcd3	 (dezena,  outD0, outD1, outD2, outD3, outD4, outD5, outD6);
bcd 		bcd4	 (unidade, outU0, outU1, outU2, outU3, outU4, outU5, outU6);
bcd 		bcd5	 (cmilhar, outcM0, outcM1, outcM2, outcM3, outcM4, outcM5, outcM6);
bcd 		bcd6	 (milhao,  outMM0, outMM1, outMM2, outMM3, outMM4, outMM5, outMM6);
bcd 		bcd7	 (dmilhao, outdMM0, outdMM1, outdMM2, outdMM3, outdMM4, outdMM5, outdMM6);


always @ (*) o_Thr <= i_Thr;

endmodule 