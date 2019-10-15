module video_controller (
	input logic clk,
	input logic [1:0] game_instruction,
	output logic h_synq,
	output logic v_synq,
	output logic [7:0] red,
	output logic [7:0] green,
	output logic [7:0] blue,
	output logic clk_25mhz,
	output logic sync_n,
	output logic blank_n
	);
	
	// VGA Control ariables
	logic enable_v_counter;
	logic [15:0] h_count_value;
	logic [15:0] v_count_value;
	
	// Sprite variables
	logic [7:0] sprite_vamo_r;
	logic [7:0] sprite_vamo_g;
	logic [7:0] sprite_vamo_b;
	logic [7:0] sprite_pika_r;
	logic [7:0] sprite_pika_g;
	logic [7:0] sprite_pika_;
	logic [7:0] white;
	logic [15:0] address;
	
	// Clock divider
	clock_divider vga_clock_gen (clk, clk_25mhz);
	
	// Counters
	horizontal_counter vga_horizontal (clk_25mhz, enable_v_counter, h_count_value);
	vertical_counter vga_Vertical (clk_25mhz, enable_v_counter, v_count_value);
	
	// Based on VGA standards
	assign h_synq = (h_count_value < 96) ? 1'b1:1'b0;
	assign v_synq = (v_count_value < 2) ? 1'b1:1'b0;
	
	// Sprite "Vamo" memories
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spriteVamoR.mem")
	vamo_r(clk, address, 0, 16'b0, sprite_vamo_r);
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spriteVamoG.mem")
	vamo_g(clk, address, 0, 16'b0, sprite_vamo_g);
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spriteVamoB.mem")
	vamo_b(clk, address, 0, 16'b0, sprite_vamo_b);
	
	// Sprite "Pika" memories
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spritePikaR.mem")
	pika_r(clk, address, 0, 16'b0, sprite_pika_r);
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spritePikaG.mem")
	pika_g(clk, address, 0, 16'b0, sprite_pika_g);
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spritePikaB.mem")
	pika_b(clk, address, 0, 16'b0, sprite_pika_b);
	
	// White
	assign white = 8'hFF;
	

	always @*
	begin		
		// Block 00
		if(h_count_value < 357 && h_count_value > 143 && v_count_value < 195 && v_count_value > 34)
		begin
			if(h_count_value <= 300 && h_count_value >= 200 && v_count_value <= 164 && v_count_value >= 64)
			begin
				address = (h_count_value - 200) + (v_count_value - 64 - 1)*100;
				case (game_instruction)
					2'b001 :
					begin
						red = sprite_vamo_r;
						green = sprite_vamo_g;
						blue = sprite_vamo_b;
					end
					2'b010 :
					begin
						red = sprite_pika_r;
						green = sprite_pika_g;
						blue = sprite_pika_b;
					end
					default :
					begin
						red = white;
						green = white;
						blue = white;
					end
				endcase
			end else
			begin
				red = 8'hFF;
				green = 8'h0;
				blue = 8'h0;
			end
		// Block 01
		end else if(h_count_value < 570 && h_count_value > 357 && v_count_value < 195 && v_count_value > 34)
		begin
			red = 8'h0;
			green = 8'hFF;
			blue = 8'h0;
		// Block 02
		end else if(h_count_value < 784 && h_count_value > 570 && v_count_value < 195 && v_count_value > 34)
		begin
			red = 8'h0;
			green = 8'h0;
			blue = 8'hFF;
		// Block 10
		end else if(h_count_value < 357 && h_count_value > 143 && v_count_value < 355 && v_count_value > 195)
		begin
			red = 8'hFF;
			green = 8'hFF;
			blue = 8'h0;
		// Block 11
		end else if(h_count_value < 570 && h_count_value > 357 && v_count_value < 355 && v_count_value > 195)
		begin
			red = 8'hFF;
			green = 8'h0;
			blue = 8'hFF;
		// Block 12
		end else if(h_count_value < 784 && h_count_value > 570 && v_count_value < 355 && v_count_value > 195)
		begin
			red = 8'h0;
			green = 8'hFF;
			blue = 8'hFF;
		// Block 20
		end else if(h_count_value < 357 && h_count_value > 143 && v_count_value < 515 && v_count_value > 355)
		begin
			red = 8'h88;
			green = 8'h0;
			blue = 8'h0;
		// Block 21
		end else if(h_count_value < 570 && h_count_value > 357 && v_count_value < 515 && v_count_value > 355)
		begin
			red = 8'h0;
			green = 8'h88;
			blue = 8'h0;
		// Block 22
		end else if(h_count_value < 784 && h_count_value > 570 && v_count_value < 515 && v_count_value > 355)
		begin
			red = 8'h0;
			green = 8'h0;
			blue = 8'h88;
		// Any other case
		end else
		begin
			red = 8'h0;
			green = 8'h0;
			blue = 8'h0;
		end
	end

	assign sync_n = 1'b0;
	assign blank_n = 1'b1;
	
endmodule
