`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:58:16 10/27/2019
// Design Name:   Vga
// Module Name:   /home/huzhanbo/ise/Briques/Vga_TB.v
// Project Name:  Briques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Vga
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Vga_TB;

	// Inputs
	reg reset;
	reg enable;
	reg clk;

	// Outputs
	wire Hsync;
	wire Vsync;
	wire [10:0] Hpos;
	wire [10:0] Vpos;

	// Instantiate the Unit Under Test (UUT)
	Vga uut (
		.reset(reset), 
		.enable(enable), 
		.clk(clk), 
		.Hsync(Hsync), 
		.Vsync(Vsync), 
		.Hpos(Hpos), 
		.Vpos(Vpos)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		enable = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset=0;
		
		#10000
		enable=0;
		#10000
		enable=1;
        
		// Add stimulus here

	end
	
	always #10
		clk=~clk;
      
endmodule

