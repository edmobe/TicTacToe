`timescale 1ns / 1ps

module testbench_Top;

	logic clk = 0;
	logic Hsynq;
	logic Vsynq;
	logic [3:0] Red;
	logic [3:0] Green;
	logic [3:0] Blue;
	
	top UUT (clk, Hsynq, Vsynq, Red, Green, Blue);
	
	always #5 clk = ~clk;
	
endmodule
