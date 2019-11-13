`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:07:22 10/23/2019 
// Design Name: 
// Module Name:    Cadre 
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
module Cadre(
    input [10:0] hpos,
    input [10:0] vpos,
    output [4:0] couleur
    );
//jaune : 11000

parameter EPAISSEUR_CADRE = 3;
parameter LARGEUR_ECRAN = 640;
parameter HAUTEUR_ECRAN = 480;

reg [4:0] regCouleur;

	always @(hpos or vpos) begin
		if (hpos < LARGEUR_ECRAN + 1 && vpos < HAUTEUR_ECRAN + 1) begin
			if (hpos > EPAISSEUR_CADRE && hpos < LARGEUR_ECRAN - EPAISSEUR_CADRE && vpos > EPAISSEUR_CADRE && vpos < HAUTEUR_ECRAN - EPAISSEUR_CADRE) begin
				regCouleur <= 5'b11111;
			end
			else begin
				regCouleur <= 5'b11000;
			end
		end
		else begin
			regCouleur <= 5'b00000;
		end
	end
	
	assign couleur = regCouleur;
			

endmodule
