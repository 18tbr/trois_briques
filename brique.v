`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:07:42 10/23/2019 
// Design Name: 
// Module Name:    brique 
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
module Brique(
    input [1:0] col,
    input [2:0] row,
    input [10:0] hpos,
    input [10:0] vpos,
    output reg[4:0] Couleur
    );
    parameter LARGEUR_BRIQUE=210;
	 parameter HAUTEUR_BRIQUE=80;
	 parameter LARGEUR_ECRAN=640;
	 parameter HAUTEUR_ECRAN=480;
	 parameter INTERVALLE_BRIQUE=1;
	 parameter COULEUR_BRIQUE=20;//  modifier
	 
	 always@(col or row or hpos or vpos) begin
	   if (hpos>=0&hpos<LARGEUR_ECRAN&vpos>=0&vpos<HAUTEUR_ECRAN) begin
	     if (hpos>=col*LARGEUR_BRIQUE+5&hpos<(col+1)*LARGEUR_BRIQUE+5&
		  vpos>=row*HAUTEUR_BRIQUE&vpos<(row+1)*HAUTEUR_BRIQUE) Couleur=COULEUR_BRIQUE;
		  else Couleur=0;
	   end
	   else Couleur=0;
	 end
endmodule
