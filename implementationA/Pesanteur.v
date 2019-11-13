`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:09 10/27/2019 
// Design Name: 
// Module Name:    Pesanteur 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//								No Interval white bar
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
    output Perdu,
    output reg [2:0] Row,
    output reg [4:0] Couleur
    );
	 
	 localparam LARGEUR_BRIQUE=210; 
	 localparam HAUTEUR_BRIQUE=80;
	 localparam INTERVALLE_BRIQUE=1;
	 // rouge {Rouge7,Vert0,Bleu0}
	 localparam COULEUR_BRIQUE=2*9;
	 localparam BLANC=0;
	 localparam VERT=3*3;
	 localparam BLEU=3;
	 localparam MARRON=2*9+2*3;
	 
	 localparam HsyncPulseTime=800;
	 localparam HDisplayTime=640;
	 localparam HVSpulseWidth=96;
	 localparam HVSfrontPorch=16;
	 localparam HVSbackPorch=48;
	 
	 localparam VsyncPulseTime=521;
	 localparam VDisplayTime=480;
	 localparam VVSpulseWidth=2;
	 localparam VVSfrontPorch=10;
	 localparam VVSbackPorch=29;
	 
	 assign Perdu = (hauteurGauche==3'b111) | (hauteurCentre==3'b111) | (hauteurDroite==3'b111);
	 
	 // row and "plus" pulse
	 always @(posedge clk) begin
		if(reset)begin
			Row<=3'b111;
			PlusGauche<=0;
			PlusCentre<=0;
			PlusDroite<=0;
		end
		else if (pulse) begin
			if (Row==0)begin
				case(col)
				0:begin Row<=3'b111;PlusGauche<=1;end
				1:begin Row<=3'b111;PlusCentre<=1; end 
				2:begin Row<=3'b111;PlusDroite<=1; end
				default: Row<=Row;
				endcase
			end
			else
				case(col)
				0:if (hauteurGauche==Row) begin Row<=3'b111;PlusGauche<=1; end else Row<=Row-1'b1;
				1:if (hauteurCentre==Row) begin Row<=3'b111;PlusCentre<=1; end else Row<=Row-1'b1;
				2:if (hauteurDroite==Row) begin Row<=3'b111;PlusDroite<=1; end  else Row<=Row-1'b1;
				default: Row<=Row;
				endcase
		end
		else begin
			PlusGauche<=0;
			PlusCentre<=0;
			PlusDroite<=0;
		end
	 end
	 
	 // Aligne
	 always @(posedge clk) begin
		if (reset)
			Aligne<=0;
		else if (Aligne == 1)
			Aligne<=0;
		else if (hauteurGauche>=1 && hauteurCentre>=1 && hauteurDroite>=1)
			Aligne<=1;
	 end
	 
	 //Draw module
	 always @(*)begin
		Couleur=BLANC;
		if (hpos>=HVSpulseWidth+HVSfrontPorch
			&& hpos<HVSpulseWidth+HVSfrontPorch+LARGEUR_BRIQUE
			&& vpos>=VVSpulseWidth+VVSfrontPorch+VDisplayTime-HAUTEUR_BRIQUE*hauteurGauche
			&& vpos<VVSpulseWidth+VVSfrontPorch+VDisplayTime)
				Couleur=VERT;
		if (hpos>=HVSpulseWidth+HVSfrontPorch+LARGEUR_BRIQUE
			&& hpos<HVSpulseWidth+HVSfrontPorch+LARGEUR_BRIQUE*2
			&& vpos>=VVSpulseWidth+VVSfrontPorch+VDisplayTime-HAUTEUR_BRIQUE*hauteurCentre
			&& vpos<VVSpulseWidth+VVSfrontPorch+VDisplayTime)
				Couleur=MARRON;
		if (hpos>=HVSpulseWidth+HVSfrontPorch++LARGEUR_BRIQUE*2
			&& hpos<HVSpulseWidth+HVSfrontPorch+LARGEUR_BRIQUE*3
			&& vpos>=VVSpulseWidth+VVSfrontPorch+VDisplayTime-HAUTEUR_BRIQUE*hauteurDroite
			&& vpos<VVSpulseWidth+VVSfrontPorch+VDisplayTime)
				Couleur=BLEU;
	 end
	 


endmodule
