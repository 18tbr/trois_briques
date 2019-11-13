`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:49:33 10/27/2019
// Design Name:   Pile
// Module Name:   /home/huzhanbo/ise/TroisBriques/Pile_TB.v
// Project Name:  TroisBriques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pile_TB;

	// Inputs
	reg plus;
	reg moins;
	reg reset;
	reg clk;

	// Outputs
	wire [2:0] Hauteur;

	// Instantiate the Unit Under Test (UUT)
	Pile uut (
		.plus(plus), 
		.moins(moins), 
		.reset(reset), 
		.clk(clk), 
		.Hauteur(Hauteur)
	);

	initial begin
		// Initialize Inputs
		plus = 0;
		moins = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		
		#100;
		plus=1;
		#100;
		plus=0;
		moins=1;
		#100;
		moins=1;
		plus=1;
		
		#100;
		moins=0;
		plus=0;
		#100;
		moins=0;
		plus=1;
        
		// Add stimulus here

	end
	
	always #10
		clk=~clk;
      
endmodule

