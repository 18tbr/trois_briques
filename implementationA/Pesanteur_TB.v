`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:41:46 10/28/2019
// Design Name:   Pesanteur
// Module Name:   /home/huzhanbo/ise/TroisBriques/Pesanteur_TB.v
// Project Name:  TroisBriques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pesanteur
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pesanteur_TB;

	// Inputs
	reg [2:0] hauteurGauche;
	reg [2:0] hauteurCentre;
	reg [2:0] hauteurDroite;
	reg [1:0] col;
	reg [10:0] hpos;
	reg [10:0] vpos;
	reg pulse;
	reg reset;
	reg clk;

	// Outputs
	wire PlusGauche;
	wire PlusCentre;
	wire PlusDroite;
	wire Aligne;
	wire Perdu;
	wire [2:0] Row;
	wire [4:0] Couleur;

	// Instantiate the Unit Under Test (UUT)
	Pesanteur uut (
		.hauteurGauche(hauteurGauche), 
		.hauteurCentre(hauteurCentre), 
		.hauteurDroite(hauteurDroite), 
		.col(col), 
		.hpos(hpos), 
		.vpos(vpos), 
		.pulse(pulse), 
		.reset(reset), 
		.clk(clk), 
		.PlusGauche(PlusGauche), 
		.PlusCentre(PlusCentre), 
		.PlusDroite(PlusDroite), 
		.Aligne(Aligne), 
		.Perdu(Perdu), 
		.Row(Row), 
		.Couleur(Couleur)
	);

	initial begin
		// Initialize Inputs
		hauteurGauche = 0;
		hauteurCentre = 0;
		hauteurDroite = 0;
		col = 0;
		hpos = 0;
		vpos = 0;
		pulse = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
        
		hauteurGauche=1;
		hauteurCentre=2;
		hauteurDroite=1;
		col=0;
		
		#1000;
		col=1;
		#1000;
		col=2;
		#1000;
		hauteurGauche=0;
		col=0;
		#1000;
		hauteurGauche=7;
		// Add stimulus here

	end
	
	always #10
		clk=~clk;
		
	always begin
	#100
	pulse=1;
	#20
	pulse=0;
	end
	
	always begin
	#10;
	hpos=hpos+10;
	vpos=vpos+10;
	if (hpos>=800)
		hpos=0;
	if(vpos>=521)
		vpos=0;
	end
      
endmodule

