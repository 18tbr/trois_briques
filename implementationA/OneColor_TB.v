`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:57:01 10/27/2019
// Design Name:   OneColorDecoder
// Module Name:   /home/huzhanbo/ise/Briques/OneColor_TB.v
// Project Name:  Briques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: OneColorDecoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module OneColor_TB;

	// Inputs
	reg [4:0] color;

	// Outputs
	wire [2:0] rouge;
	wire [2:0] vert;
	wire [1:0] bleu;

	// Instantiate the Unit Under Test (UUT)
	OneColorDecoder uut (
		.color(color), 
		.rouge(rouge), 
		.vert(vert), 
		.bleu(bleu)
	);

	initial begin
		// Initialize Inputs
		color = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #10
		color=color+1;
      
endmodule

