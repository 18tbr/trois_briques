`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:04:48 10/27/2019
// Design Name:   Rgb
// Module Name:   /home/huzhanbo/ise/Briques/Rgb_TB.v
// Project Name:  Briques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Rgb
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Rgb_TB;

	// Inputs
	reg [4:0] couleurPave;
	reg [4:0] couleurCadre;
	reg [4:0] couleurPesanteur;

	// Outputs
	wire [2:0] rouge;
	wire [2:0] vert;
	wire [1:0] bleu;

	// Instantiate the Unit Under Test (UUT)
	Rgb uut (
		.couleurPave(couleurPave), 
		.couleurCadre(couleurCadre), 
		.couleurPesanteur(couleurPesanteur), 
		.rouge(rouge), 
		.vert(vert), 
		.bleu(bleu)
	);

	initial begin
		// Initialize Inputs
		couleurPave = 0;
		couleurCadre = 0;
		couleurPesanteur = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		 couleurPave=11; 
		 couleurPesanteur=10;
		 couleurCadre=9;
		 
		 #100
		 couleurPave=0;
		 
		 #100
		 couleurPesanteur=0;
		 
		 #100
		 couleurCadre=0;
		// Add stimulus here

	end
      
endmodule

