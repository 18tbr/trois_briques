`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:27:43 10/27/2019
// Design Name:   Manette
// Module Name:   /home/huzhanbo/ise/TroisBriques/Manette_TB.v
// Project Name:  TroisBriques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Manette
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Manette_TB;

	// Inputs
	reg boutonPlus;
	reg boutonMoins;
	reg [2:0] hauteurGauche;
	reg [2:0] hauteurDroite;
	reg [2:0] hauteurCentre;
	reg [2:0] row;
	reg reset;
	reg clk;

	// Outputs
	wire [1:0] col;

	// Instantiate the Unit Under Test (UUT)
	Manette uut (
		.boutonPlus(boutonPlus), 
		.boutonMoins(boutonMoins), 
		.hauteurGauche(hauteurGauche), 
		.hauteurDroite(hauteurDroite), 
		.hauteurCentre(hauteurCentre), 
		.row(row), 
		.reset(reset), 
		.clk(clk), 
		.col(col)
	);

	initial begin
		// Initialize Inputs
		boutonPlus = 0;
		boutonMoins = 0;
		hauteurGauche = 0;
		hauteurDroite = 0;
		hauteurCentre = 0;
		row = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		hauteurGauche=3;
		hauteurCentre=5;
		hauteurCentre=6;
		
		#100;
		row =7;
		
		#100
		boutonMoins=1;
		#500
		boutonMoins=0;
		
		#100
		boutonPlus=1;
		#500
		boutonPlus=0;
		
		#100
		boutonPlus=1;
		#500
		boutonPlus=0;
		
		#100
		boutonMoins=1;
		#500
		boutonMoins=0;
		 
		// Add stimulus here

		#100;
		hauteurGauche=6;
		hauteurCentre=5;
		hauteurCentre=3;
		
		#100
		boutonPlus=1;
		#500
		boutonPlus=0;
		
		#100
		boutonMoins=1;
		#500
		boutonMoins=0;
		
		#100
		boutonMoins=1;
		#500
		boutonMoins=0;

		#100
		boutonPlus=1;
		#500
		boutonPlus=0;
		
end
	
	always #10
		clk=~clk;
      
endmodule

