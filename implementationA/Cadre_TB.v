`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:55:15 10/27/2019
// Design Name:   Cadre
// Module Name:   /home/huzhanbo/ise/Briques/Cadre_TB.v
// Project Name:  Briques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Cadre
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Cadre_TB;

	// Inputs
	reg [10:0] hpos;
	reg [10:0] vpos;

	// Outputs
	wire [4:0] couleur;

	// Instantiate the Unit Under Test (UUT)
	Cadre uut (
		.hpos(hpos), 
		.vpos(vpos), 
		.couleur(couleur)
	);

	localparam Jaune=2*9 + 2*3;
	localparam Blanc=0;
	 
	initial begin
		// Initialize Inputs
		hpos = 0;
		vpos = 0;

		// Wait 100 ns for global reset to finish
		#100;
       hpos=96+16;
		 vpos=2+10+200;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+18;
		 vpos=2+10+200;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+19;
		 vpos=2+10+200;
		 #10;
		 if(couleur != Blanc)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+640-3;
		 vpos=2+10+200;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+640-1;
		 vpos=2+10+200;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+640;
		 vpos=2+10+200;
		 #10;
		 if(couleur != Blanc)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		  #100;
       hpos=96+16+640-1;
		 vpos=2+10+480;
		 #10;
		 if(couleur != Blanc)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+640-1;
		 vpos=2+10+479;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+640-1;
		 vpos=2+10;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+300;
		 vpos=2+10;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+300;
		 vpos=2+10+2;
		 #10;
		 if(couleur != Jaune)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		 
		 #100;
       hpos=96+16+300;
		 vpos=2+10+3;
		 #10;
		 if(couleur != Blanc)begin
			$display("assert happened in %m\n");
			$finish;
		 end
		// Add stimulus here

	end
      
endmodule

