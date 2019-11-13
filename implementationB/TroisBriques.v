`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:35 10/30/2019 
// Design Name: 
// Module Name:    TroisBriques 
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
module TroisBriques(
    input reset,
    input clk,
    input enable,
    input boutonPlus,
    input boutonMoins,
    output [6:0] Cathodes,
    output [3:0] Anodes,
    output Hsync,
    output Vsync,
    output [2:0] rouge,
    output [2:0] vert,
    output [1:0] bleu
    );

	wire pulse;
	wire sevenSeg;
	wire tombeeBrique;
	wire [10:0] hpos;
	wire [10:0] vpos;
	wire [2:0] hauteurG;
	wire [2:0] hauteurC;
	wire [2:0] hauteurD;
	wire [1:0] col;
	wire plusG;
	wire plusC;
	wire plusD;
	wire aligne;
	wire perdu;
	wire [2:0] row;
	wire [4:0] couleurPes;
	wire [4:0] couleurPave;
	wire [4:0] couleurCadre;

	BaseDeTemps bdt(.reset(reset),.enable(enable),.clk(clk),.pulse(pulse),.sevenSeg(sevenSeg),.tombeeBrique(tombeeBrique));

	Vga ecran(.reset(reset),.enable(pulse),.clk(clk),.Hsync(Hsync),.Vsync(Vsync),.Hpos(hpos),.Vpos(vpos));

	Pesanteur tetris(.hauteurGauche(hauteurG),.hauteurCentre(hauteurC),.hauteurDroite(hauteurD),.col(col),.hpos(hpos),.vpos(vpos),.pulse(tombeeBrique),.reset(reset),.clk(clk),
		.PlusGauche(plusG),.PlusCentre(plusC),.PlusDroite(plusD),.Aligne(aligne),.Perdu(perdu),.Row(row),.Couleur(couleurPes));
		
	Pile gauche(.reset(reset),.clk(clk),.Plus(plusG),.Moins(aligne),.Hauteur(hauteurG));
	Pile centre(.reset(reset),.clk(clk),.Plus(plusC),.Moins(aligne),.Hauteur(hauteurC));
	Pile droite(.reset(reset),.clk(clk),.Plus(plusD),.Moins(aligne),.Hauteur(hauteurD));

	Score partie(.aligne(aligne),.perdu(perdu),.reset(reset),.clk(clk),.enable(sevenSeg),.Cathodes(Cathodes),.Anodes(Anodes));

	Manette poignee(.boutonPlus(boutonPlus),.boutonMoins(boutonMoins),.hauteurGauche(hauteurG),.hauteurCentre(hauteurC),.hauteurDroite(hauteurD),.row(row),.reset(reset),.clk(clk),.Col(col));

	Brique pave(.col(col),.row(row),.hpos(hpos),.vpos(vpos),.Couleur(couleurPave));

	Cadre bord(.hpos(hpos),.vpos(vpos),.couleur(couleurCadre));

	rgb pixel(.couleurPave(couleurPave),.couleurCadre(couleurCadre),.couleurPesanteur(couleurPes),.rouge(rouge),.vert(vert),.bleu(bleu));

endmodule
