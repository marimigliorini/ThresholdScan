module dec9999
(
	input	 [31:0] sw,
	output [3:0 ] dmilhao, milhao, cmilhar, dmilhar, milhar, centena, dezena, unidade 
);

//circuito da unidade
assign unidade = ((((((sw % 24'd10000000)%24'd1000000)%24'd100000)%14'd10000)%10'd1000)%7'd100)%4'd10;

//circuito da dezena
assign dezena  = ((((((sw % 24'd10000000)%24'd1000000)%24'd100000)%14'd10000)%10'd1000)%7'd100)/4'd10;


//circuito da centena
assign centena  = (((((sw % 24'd10000000)%24'd1000000)%24'd100000)%14'd10000)%10'd1000)/7'd100;


//circuito da milhar
assign milhar  = ((((sw % 24'd10000000)%24'd1000000)%24'd100000)%14'd10000)/10'd1000;


//circuito da dezena de milhar
assign dmilhar = (((sw % 24'd10000000)%24'd1000000)%24'd100000)/14'd10000;

//circuito centena de milhar
assign cmilhar = ((sw % 24'd10000000)%24'd1000000)/24'd100000;

//circuito milhao
assign milhao = (sw % 24'd10000000)/24'd1000000;

//circuito dmilhao
assign dmilhao = sw / 24'd10000000;

endmodule 