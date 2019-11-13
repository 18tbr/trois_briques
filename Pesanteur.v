`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:54:16 10/23/2019 
// Design Name: 
// Module Name:    Pesanteur 
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
module Pesanteur(
    input [2:0] hauteurGauche,
    input [2:0] hauteurCentre,
    input [2:0] hauteurDroite,
    input [1:0] col,
    input [10:0] hpos,
    input [10:0] vpos,
    input pulse,
    input reset,
    input clk,
    output reg PlusGauche,
    output reg PlusCentre,
    output reg PlusDroite,
    output reg Aligne,
    output reg Perdu,
    output reg [2:0] Row,
    output reg [4:0] Couleur
    );
		
	 localparam LARGEUR_ECRAN = 640;
	 localparam HAUTEUR_ECRAN = 480;
	 localparam LARGEUR_BRIQUE = 210;
	 localparam HAUTEUR_BRIQUE = 80;
	 
	 always @(posedge clk) begin
	 
	 	PlusGauche=0;
		PlusCentre=0;
		PlusDroite=0;
		Aligne=0;
		Perdu=0;	
		//RETOURNE LES IMPULSIONS A ZERO
		if (hpos>5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*0*LARGEUR_BRIQUE
		&hpos<5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*1*LARGEUR_BRIQUE
		&vpos>HAUTEUR_ECRAN/HAUTEUR_BRIQUE
		&vpos<HAUTEUR_ECRAN/HAUTEUR_BRIQUE*HAUTEUR_BRIQUE*hauteurGauche) Couleur=5'b00001;
		if (hpos>5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*1*LARGEUR_BRIQUE
		&hpos<5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*2*LARGEUR_BRIQUE
		&vpos>HAUTEUR_ECRAN/HAUTEUR_BRIQUE
		&vpos<HAUTEUR_ECRAN/HAUTEUR_BRIQUE*HAUTEUR_BRIQUE*hauteurCentre) Couleur=5'b00100;			
		if (hpos>5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*2*LARGEUR_BRIQUE
		&hpos<5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*3*LARGEUR_BRIQUE
		&vpos>HAUTEUR_ECRAN/HAUTEUR_BRIQUE
		&vpos<HAUTEUR_ECRAN/HAUTEUR_BRIQUE*HAUTEUR_BRIQUE*hauteurDroite) Couleur=5'b10000;	
		// MONTRE LA COULEUR DE LA PILE CIBLEE PAR LA BALAYAGE DE L'ECRAN
		if (reset) begin
			PlusGauche=0;
			PlusCentre=0;
			PlusDroite=0;
			Aligne=0;
		   Perdu=0;
			Row=3'b000;
			Couleur=5'b00000;
		end	
		//RESET
		else if(pulse) begin
			if (hauteurGauche&hauteurCentre&hauteurDroite) Aligne=1;//S'IL Y A TROIS BRIQUES SUR LE SOL , ON LES FAIT DISPARAITRE
			case(col)
				2'b00:if (hauteurGauche==5)
							Perdu=1;//LORSQUE LA PILE AU GAUCHE ATTEINT LE SOMMET DE L'ECRAN , LA PARTIE EST FINIE ET LE SIGNAL PERDU EST ACTIVE
				else if (Row+hauteurGauche==5) begin
					PlusGauche=1;
					Row=0;//SI LA BRIQUE TOUCHE LA PILE AU GAUCHE , LE ROW RETOURNE A ZERO
				end
				2'b01:if (hauteurCentre==5)
							Perdu=1;//LORSQUE LA PILE AU CENTRE ATTEINT LE SOMMET DE L'ECRAN , LA PARTIE EST FINIE ET LE SIGNAL PERDU EST ACTIVE
				else if (Row+hauteurCentre==5) begin
					PlusCentre=1;
					Row=0;//SI LA BRIQUE TOUCHE LA PILE AU CENTRE , LE ROW RETOURNE A ZERO
				end				
				2'b10:if (hauteurDroite==5)
							Perdu=1;//LORSQUE LA PILE AU DROITE ATTEINT LE SOMMET DE L'ECRAN , LA PARTIE EST FINIE ET LE SIGNAL PERDU EST ACTIVE
				else if (Row+hauteurDroite==5) begin
					PlusDroite=1;
					Row=0;//SI LA BRIQUE TOUCHE LA PILE AU DROITE , LE ROW RETOURNE A ZERO
				end
			endcase
			Row=Row+1;					
	 end
	end
			
endmodule