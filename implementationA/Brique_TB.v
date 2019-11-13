`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:13:27 10/27/2019
// Design Name:   Brique
// Module Name:   /home/huzhanbo/ise/Briques/Brique_TB.v
// Project Name:  Briques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Brique
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Brique_TB;

	// Inputs
	reg [1:0] col;
	reg [2:0] row;
	reg [10:0] hpos;
	reg [10:0] vpos;

	// Outputs
	wire [4:0] Couleur;

	// Instantiate the Unit Under Test (UUT)
	Brique uut (
		.col(col), 
		.row(row), 
		.hpos(hpos), 
		.vpos(vpos), 
		.Couleur(Couleur)
	);

	initial begin
		// Initialize Inputs
		col = 0;
		row = 0;
		hpos = 0;
		vpos = 0;

		// Wait 100 ns for global reset to finish
		#1000;
		col=1;
		row=2;
        
		// Add stimulus here

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

