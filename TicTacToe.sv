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
	
	// Based on game logic
	// Will indicate video_controller what to show
	logic [1:0] block00;
	logic [1:0] block01;
	logic [1:0] block02;
	//logic [1:0] block10;
	logic [1:0] block11;
	logic [1:0] block12;
	logic [1:0] block20;
	logic [1:0] block21;
	logic [1:0] block22;
	//logic [3:0] selected;
	

	// ****************** PLEASE MODIFY THIS VALUES BASED ON THE GAME LOGIC :) *******************
	// Sprite selectors: 00 or 11 = no sprite, 01 = sprite 1, 10 = sprite 2
	// Block 00
	assign block00 = 2'b11;
	// Block 01
	assign block01 = 2'b01;
	// Block 02
	assign block02 = 2'b10;
	// Block 10
	//assign block10 = 2'b00;
	// Block 11
	assign block11 = 2'b10;
	// Block 12
	assign block12 = 2'b01;
	// Block 20
	assign block20 = 2'b00;
	// Block 21
	assign block21 = 2'b11;
	// Block 22
	assign block22 = 2'b00;
	
	// Selected (indicates the selected block)
	//assign selected = 4'b0000;
	// *******************************************************************************************

	video_controller VGA (
	CLOCK_50,
	block00,
	block01,
	block02,
	SW[5:4],
	block11,
	block12,
	block20,
	block21,
	block22,
	SW[3:0],
	VGA_HS,
	VGA_VS,
	VGA_R,
	VGA_G,
	VGA_B,
	VGA_CLK,
	VGA_SYNC_N,
	VGA_BLANK_N);
	
endmodule
