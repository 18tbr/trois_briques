`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:32 10/30/2019 
// Design Name: 
// Module Name:    Vga 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Vga(
    input reset,
    input enable,
    input clk,
    output Hsync,
    output Vsync,
    output [10:0] Hpos,
    output [10:0] Vpos
    );
	 
	localparam H_DISP = 640;
	localparam H_PULSE = 96;
	localparam H_FRONT_PORCH = 16;
	localparam H_BACK_PORCH = 48;
	
	localparam V_DISP = 480;
	localparam V_PULSE = 2;
	localparam V_FRONT_PORCH = 10;
	localparam V_BACK_PORCH = 29;
	
	// Note : The implementation given here is that :
	/* Whether we are displaying pixels or not, the value of Hpos will keep incrementing, that way we wont replace the drawn pixels with black ones.
	When the time comes to change line, Hpos will be set to 0 and Vpos will be incremented.
	In order to decide when we want to change line, we will simply count clock cycles. Horizontal period lasts 800 + 96 clock cycles.
	We begin our period right after the so-called "back-porch".
	The same convention is used along the vertical axis.
	*/
	
	// We start at the position given when both hsync and vsync are set to 1, i.e. at the beginning of the front porch for both.
	reg [10:0] horizontal_clocks_counted = H_DISP + H_PULSE + H_FRONT_PORCH;	// Large enough to store integers up to 800.
	reg [10:0] vertical_lines_counted = V_DISP + V_PULSE + V_FRONT_PORCH;	//	We have to store up to 521, which is just a bit larger than 512, what a shame...
	// In fact, vertical_lines_counted is Vpos and horizontal_clocks_counted is Hpos. How convenient!
	
	always @(posedge clk) begin
		if (reset) begin
			horizontal_clocks_counted = H_DISP + H_PULSE + H_FRONT_PORCH;
			vertical_lines_counted = V_DISP + V_PULSE + V_FRONT_PORCH;
		end
		else if (enable) begin	
			horizontal_clocks_counted = horizontal_clocks_counted + 1;
			if (horizontal_clocks_counted == H_DISP + H_PULSE + H_FRONT_PORCH + H_BACK_PORCH) begin	// Horizontal line done, we have to go to the next line.
				horizontal_clocks_counted = 0;
				vertical_lines_counted = vertical_lines_counted + 1;
				if (vertical_lines_counted == V_DISP + V_PULSE + V_FRONT_PORCH + V_BACK_PORCH) begin
					vertical_lines_counted = 0;	// i.e. we have reached the last line of the scrren, we have to start again from the top.
				end
			end
		end
	end
	
	assign Vsync = ~((vertical_lines_counted == V_DISP + V_FRONT_PORCH) || (vertical_lines_counted == V_DISP + V_FRONT_PORCH + 1));	// i.e. Vsync is true everywhere but on line 480 + 10 and 480 + 10 + 1
	assign Hsync = ~((horizontal_clocks_counted >= H_DISP + H_FRONT_PORCH) && (horizontal_clocks_counted <= H_DISP + H_FRONT_PORCH + H_PULSE - 1));	// i.e. Hsync is set to tru if we haven't reached the pulse or if we have already gone past it.
	assign Hpos = horizontal_clocks_counted;
	assign Vpos = vertical_lines_counted;
endmodule
