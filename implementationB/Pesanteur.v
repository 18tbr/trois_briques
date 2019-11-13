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
//module Pesanteur(
//    input [2:0] hauteurGauche,
//    input [2:0] hauteurCentre,
//    input [2:0] hauteurDroite,
//    input [1:0] col,
//    input [10:0] hpos,
//    input [10:0] vpos,
//    input pulse,
//    input reset,
//    input clk,
//    output reg PlusGauche,
//    output reg PlusCentre,
//    output reg PlusDroite,
//    output reg Aligne,
//    output reg Perdu,
//    output reg [2:0] Row,
//    output reg [4:0] Couleur
//    );
//		
//	 localparam LARGEUR_ECRAN = 640;
//	 localparam HAUTEUR_ECRAN = 480;
//	 localparam LARGEUR_BRIQUE = 210;
//	 localparam HAUTEUR_BRIQUE = 80;
//	 
//	 always @(posedge clk) begin
//	 
//	 	PlusGauche=0;
//		PlusCentre=0;
//		PlusDroite=0;
//		Aligne=0;
//		Perdu=0;	
//		//RETOURNE LES IMPULSIONS A ZERO
//		if (hpos>5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*0*LARGEUR_BRIQUE
//		&hpos<5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*1*LARGEUR_BRIQUE
//		&vpos>HAUTEUR_ECRAN/HAUTEUR_BRIQUE
//		&vpos<HAUTEUR_ECRAN/HAUTEUR_BRIQUE*HAUTEUR_BRIQUE*hauteurGauche) Couleur=5'b00001;
//		if (hpos>5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*1*LARGEUR_BRIQUE
//		&hpos<5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*2*LARGEUR_BRIQUE
//		&vpos>HAUTEUR_ECRAN/HAUTEUR_BRIQUE
//		&vpos<HAUTEUR_ECRAN/HAUTEUR_BRIQUE*HAUTEUR_BRIQUE*hauteurCentre) Couleur=5'b00100;			
//		if (hpos>5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*2*LARGEUR_BRIQUE
//		&hpos<5+(LARGEUR_ECRAN-10)/LARGEUR_BRIQUE*3*LARGEUR_BRIQUE
//		&vpos>HAUTEUR_ECRAN/HAUTEUR_BRIQUE
//		&vpos<HAUTEUR_ECRAN/HAUTEUR_BRIQUE*HAUTEUR_BRIQUE*hauteurDroite) Couleur=5'b10000;	
//		// MONTRE LA COULEUR DE LA PILE CIBLEE PAR LA BALAYAGE DE L'ECRAN
//		if (reset) begin
//			PlusGauche=0;
//			PlusCentre=0;
//			PlusDroite=0;
//			Aligne=0;
//		   Perdu=0;
//			Row=3'b000;
//			Couleur=5'b00000;
//		end	
//		//RESET
//		else if(pulse) begin
//			if (hauteurGauche&hauteurCentre&hauteurDroite) Aligne=1;//S'IL Y A TROIS BRIQUES SUR LE SOL , ON LES FAIT DISPARAITRE
//			case(col)
//				2'b00:if (hauteurGauche==5)
//							Perdu=1;//LORSQUE LA PILE AU GAUCHE ATTEINT LE SOMMET DE L'ECRAN , LA PARTIE EST FINIE ET LE SIGNAL PERDU EST ACTIVE
//				else if (Row+hauteurGauche==5) begin
//					PlusGauche=1;
//					Row=0;//SI LA BRIQUE TOUCHE LA PILE AU GAUCHE , LE ROW RETOURNE A ZERO
//				end
//				2'b01:if (hauteurCentre==5)
//							Perdu=1;//LORSQUE LA PILE AU CENTRE ATTEINT LE SOMMET DE L'ECRAN , LA PARTIE EST FINIE ET LE SIGNAL PERDU EST ACTIVE
//				else if (Row+hauteurCentre==5) begin
//					PlusCentre=1;
//					Row=0;//SI LA BRIQUE TOUCHE LA PILE AU CENTRE , LE ROW RETOURNE A ZERO
//				end				
//				2'b10:if (hauteurDroite==5)
//							Perdu=1;//LORSQUE LA PILE AU DROITE ATTEINT LE SOMMET DE L'ECRAN , LA PARTIE EST FINIE ET LE SIGNAL PERDU EST ACTIVE
//				else if (Row+hauteurDroite==5) begin
//					PlusDroite=1;
//					Row=0;//SI LA BRIQUE TOUCHE LA PILE AU DROITE , LE ROW RETOURNE A ZERO
//				end
//			endcase
//			Row=Row+1;					
//	 end
//	end
//			
//endmodule



module Pesanteur (
	input [2:0] hauteurGauche,
	input [2:0] hauteurCentre,
	input [2:0] hauteurDroite,
	input [1:0] col,
	input [10:0] hpos,
	input [10:0] vpos,
	input pulse,
	input reset,
	input clk,
	output PlusGauche,
	output PlusCentre,
	output PlusDroite,
	output Aligne,
	output Perdu,
	output [2:0] Row,
	output [4:0] Couleur
	);
	
	localparam ROW_COUNT = 6;
	localparam LARGEUR_ECRAN = 640;
	localparam HAUTEUR_ECRAN = 480;
	localparam LARGEUR_BRIQUE = 210;
	localparam HAUTEUR_BRIQUE = 80;
	localparam EPAISSEUR_CADRE = 5;
	
	reg [4:0] color_buffer = 0;	// Used to assign to Couleur
	
	// Values were chosen randomly
	localparam COLOR_LEFT = 14;
	localparam COLOR_CENTER = 21;
	localparam COLOR_RIGHT = 5;
	localparam COLOR_WHITE = 26;
	//	reg [4:0] color_mvt = 21;	// The color of a moving brick.
	// By default the columns don't have the same color.
	
	// Note that the 0 row is the top one
	reg [2:0] row_buffer = 0;	// A buffer used to handle the current row
	reg [1:0] hit = 3;	// Set to the column number if the block lands on top of one stack	
	
	always @(posedge clk) begin
		if (reset) begin
			row_buffer = 0;	// i.e. highest row
			hit = 3;	// i.e. no collisions have been detected
		end
		else if (pulse) begin
			row_buffer = row_buffer + 1;	// Note that this value can not be inferior to 0 because for that to happend we would need to have row_buufer == 0 at the beginning of the cycle, but that can't happened because of the next always block.
			
			// Detect collision
			if ((col == 0) && (row_buffer == ROW_COUNT - hauteurGauche)) hit = 0;
			else if ((col == 1) && (row_buffer == ROW_COUNT - hauteurCentre)) hit = 1;
			else if ((col == 2) && (row_buffer == ROW_COUNT - hauteurDroite)) hit = 2;
			else hit = 3;
			
			// Reset row if collision has been detected
			if (hit!=3) row_buffer = 0;
		end
	end
	
	// One block used to set the color output (that is weird and has nothing to do with the rest of this module, but we were told to do so.
	always @(hpos or vpos or hauteurGauche or hauteurCentre or hauteurDroite) begin
		if (vpos >= EPAISSEUR_CADRE && vpos <= HAUTEUR_ECRAN - EPAISSEUR_CADRE) begin	// i.e. we are within the right height of the screen
			if (hpos >= EPAISSEUR_CADRE && hpos <= LARGEUR_BRIQUE + EPAISSEUR_CADRE) begin	// i.e. first column
				if (vpos >= (HAUTEUR_BRIQUE * (ROW_COUNT - hauteurGauche))) color_buffer = COLOR_LEFT;	// i.e. we are inside the left stack
				else color_buffer = COLOR_WHITE;	//i.e. white background
			end
			else if (hpos >= LARGEUR_BRIQUE + EPAISSEUR_CADRE && hpos <= 2 * LARGEUR_BRIQUE + EPAISSEUR_CADRE) begin	// Because the if are evaluated sequentially we don't need the && hpos>=LARGEUR_BRIQUE
				if (vpos >= (HAUTEUR_BRIQUE * (ROW_COUNT - hauteurCentre))) color_buffer = COLOR_CENTER;	// i.e. we are inside the left stack
				else color_buffer = COLOR_WHITE;	//i.e. white background			
			end
			else if (hpos >= 2 * LARGEUR_BRIQUE + EPAISSEUR_CADRE && hpos <= 3 * LARGEUR_BRIQUE + EPAISSEUR_CADRE) begin
				if (vpos >= (HAUTEUR_BRIQUE * (ROW_COUNT - hauteurDroite))) color_buffer = COLOR_RIGHT;	// i.e. we are inside the left stack
				else color_buffer = COLOR_WHITE;	//i.e. white background			
			end
			else color_buffer = 0;
		end
		else	color_buffer = 0;	// i.e. we set the color to black outside of the screen
	end
	
	reg align_reg = 0;
	reg plusGauche_reg = 0;
	reg plusCentre_reg = 0;
	reg plusDroite_reg = 0;
	
	always @(hauteurGauche or hauteurCentre or hauteurDroite) begin
		// We have to detect whether the block will cause the last row to be removed, in which case we mustn't trigger Plus<column>
		
		// Not sure whether the values would get reset on their own, so I set them all to a default value here.
		align_reg = 0;
		plusGauche_reg = 0;
		plusCentre_reg = 0;
		plusDroite_reg = 0;
		case (hit)
			0 : begin	// We have landed on top of the left stack, we have to check whether a line has to be removed.
				if (hauteurCentre > 0 && hauteurDroite > 0) align_reg = 1;
				else plusGauche_reg = 1;
			end
			1 : begin
				if (hauteurGauche > 0 && hauteurDroite > 0) align_reg = 1;
				else plusCentre_reg = 1;
			end
			2 : begin
				if (hauteurGauche > 0 && hauteurCentre > 0) align_reg = 1;
				else plusDroite_reg = 1;
			end
			default : align_reg = 0;
		endcase
	end
	
	assign Aligne = align_reg;
	assign Perdu = (hauteurGauche == ROW_COUNT - 1 || hauteurCentre == ROW_COUNT - 1 || hauteurDroite == ROW_COUNT - 1);
	assign PlusGauche = plusGauche_reg;
	assign PlusCentre = plusCentre_reg;
	assign PlusDroite = plusDroite_reg;
	assign Couleur = color_buffer;
	assign Row = row_buffer;
endmodule