module ThrAdj_tb();

reg clk;
reg enb;


initial begin
	clk = 0;
	enb = 0;

	#600   enb = 1'b1;
	#1000  enb = 1'b0;
end

always #10 clk <= ~clk;

wire out;

control teste (clk, enb, out);

endmodule 