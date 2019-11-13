`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:09:39 10/28/2019 
// Design Name: 
// Module Name:    TOP 
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
module TOP(
    input clk,
    input reset,
    input leftButton,
    input rightButton,
    output [6:0] cathodes,
    output [3:0] anodes,
    output [7:0] color,
    output vSync,
    output hSync
    );
	 
	 wire [2:0] hauteurGauche,hauteurDroite,hauteurCentre;
	 wire [2:0] row;
	 wire [1:0] col;
	 wire pulse,sevenSeg,tombeeBrique;
	 wire [2:0] rouge,vert;
	 wire [1:0] bleu;
	 wire [4:0]couleurCadre,couleurPave,couleurPesanteur;
	 wire [10:0] vPos,hPos;
	 wire aligne,perdu;
	 wire plusDroite,plusCentre,plusGauche;
	 
	 assign color={rouge,vert,bleu};
	 Manette poignee (.boutonPlus(rightButton), .boutonMoins(leftButton), .hauteurGauche(hauteurGauche), 
											.hauteurDroite(hauteurDroite), .hauteurCentre(hauteurCentre), 
											.row(row), .reset(reset), .clk(clk), .col(col));
											
	 BaseDeTemps dbt (.reset(reset), .enable(1'b1), .clk(clk), 
											 .pulse(pulse), .sevenSeg(sevenSeg), .tombeeBrique(tombeeBrique));
										
/*	BaseDeTemps dbt (.reset(reset), .enable(~perdu), .clk(clk), 
											 .pulse(pulse), .sevenSeg(sevenSeg), .tombeeBrique(tombeeBrique));*/
											 
	 Rgb pixel (.couleurPave(couleurPave), .couleurCadre(couleurCadre), 
						 .couleurPesanteur(couleurPesanteur), .rouge(rouge), .vert(vert), .bleu(bleu));
						 
	 Cadre bord (.hpos(hPos), .vpos(vPos), .couleur(couleurCadre));
	 
	 Score partie (.aligne(aligne), .perdu(perdu), .reset(reset), .clk(clk), 
								 .Cathodes(cathodes), .Anodes(anodes));

	 Vga ecran (.reset(reset), .enable(pulse), .clk(clk), .Hsync(hSync), .Vsync(vSync), 
							 .Hpos(hPos), .Vpos(vPos));
	/*
	assign hSync=pulse;
	assign vSync=pulse;*/
					
	 Brique pave (.col(col), .row(row), .hpos(hPos), .vpos(vPos), .Couleur(couleurPave));

	 Pile gauche (.plus(plusGauche), .moins(aligne), .reset(reset), .clk(clk), .Hauteur(hauteurGauche));
	 Pile centre (.plus(plusCentre), .moins(aligne), .reset(reset), .clk(clk), .Hauteur(hauteurCentre));
	 Pile droite (.plus(plusDroite), .moins(aligne), .reset(reset), .clk(clk), .Hauteur(hauteurDroite));
	 
	 Pesanteur tetris (.hauteurGauche(hauteurGauche), .hauteurCentre(hauteurCentre), .hauteurDroite(hauteurDroite), 
										 .col(col), .hpos(hPos), .vpos(vPos), .pulse(tombeeBrique), .reset(reset), .clk(clk), 
										 .PlusGauche(plusGauche), .PlusCentre(plusCentre), .PlusDroite(plusDroite), 
										 .Aligne(aligne), .Perdu(perdu), .Row(row), .Couleur(couleurPesanteur));
										 
endmodule
