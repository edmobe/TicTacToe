module TicTacToe(
	input CLOCK_50,
	input [9:0] SW,
	output [9:0] LEDR,
	output VGA_HS,
	output VGA_VS,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output VGA_CLK,
	output VGA_SYNC_N,
	output VGA_BLANK_N
	);
	
	logic [1:0] game_logic;
	
	video_controller VGA (CLOCK_50, SW[1:0], VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N);
	
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