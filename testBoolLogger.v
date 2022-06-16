`timescale 1ns/1ps
module testBoolLogger();

reg clk;
reg rst_;
reg i;

initial begin
	clk <= 0;
	forever #1 clk <= !clk;
end

initial begin
	rst_ <= 0;
	i <= 0;
	#3 rst_ <= 1;
	#(5*2) i<=!i;
	#(16*2) i<=!i;
	#(3*2) i<=!i;
	#(1*2) i<=!i;
	#(1*2) i<=!i;
	#(1*2) i<=!i;
	#(2*2) i<=!i;
	#(9*2) i<=!i;
	#(5*2) i<=!i;
	#(3*2) i<=!i;
	#(4*2) i<=!i;
	#(6*2) i<=!i;
	#(7*2) i<=!i;
	#(1*2) i<=!i;
	$finish;
end

BoolLogger_Top #(
	.BufferDepth(12)
)blg0(
	.s00_axi_aclk(clk),
	.s00_axi_aresetn(rst_),
	.data_in(i)
);
endmodule