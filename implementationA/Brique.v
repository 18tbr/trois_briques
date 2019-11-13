`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:26 10/27/2019 
// Design Name: 
// Module Name:    Brique 
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
    output reg [4:0] Couleur
    );
	 
	 localparam LARGEUR_BRIQUE=210; 
	 localparam HAUTEUR_BRIQUE=80;
	 localparam INTERVALLE_BRIQUE=1;
	 // rouge {Rouge7,Vert0,Bleu0}
	 localparam COULEUR_BRIQUE=2*9;
	 localparam Blanc=0;
	 
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
	 
	 always @(*) begin
		Couleur=Blanc;
		if (hpos>=HVSpulseWidth+HVSfrontPorch+LARGEUR_BRIQUE*col+INTERVALLE_BRIQUE
			&& hpos<HVSpulseWidth+HVSfrontPorch+LARGEUR_BRIQUE*(col+1)-INTERVALLE_BRIQUE
			&& vpos>=VVSpulseWidth+VVSfrontPorch+VDisplayTime-(HAUTEUR_BRIQUE*(row+1)-INTERVALLE_BRIQUE)
			&& vpos<VVSpulseWidth+VVSfrontPorch+VDisplayTime-(HAUTEUR_BRIQUE*row+INTERVALLE_BRIQUE))
				Couleur=COULEUR_BRIQUE;
	 end


endmodule
