module TicTacToe(
	input clk,
	output VGA_HS,
	output VGA_VS,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output VGA_CLK,
	output VGA_SYNC_N,
	output VGA_BLANK_N
	);
	
	top UUT (clk, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N);

endmodule















/*
module TicTacToe(
	input logic CLK,
	input logic[9:0] x,
	input logic[9:0] y,
	output logic[7:0] VGA_R,
	output logic[7:0] VGA_G,
	output logic[7:0] VGA_B
	);

	sprite_controller ctrl(CLK, x, y, VGA_R, VGA_G, VGA_B);

endmodule
*/	