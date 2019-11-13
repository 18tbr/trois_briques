`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:39:50 10/27/2019 
// Design Name: 
// Module Name:    Cadre 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:  Generate the enclose of the main screan
//                       should test via board directly
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
    output reg [4:0] couleur
    );
	 
	 localparam HsyncPulseTime=800;
	 //localparam HsyncPulseTime=10;
	 localparam HDisplayTime=640;
	 localparam HVSpulseWidth=96;
	 //localparam HVSpulseWidth=2;
	 localparam HVSfrontPorch=16;
	 localparam HVSbackPorch=48;
	 
	 localparam VsyncPulseTime=521;
	 //localparam VsyncPulseTime=10;
	 localparam VDisplayTime=480;
	 localparam VVSpulseWidth=2;
	 localparam VVSfrontPorch=10;
	 localparam VVSbackPorch=29;
	 
	 // {Rouge0,Vert7,Bleu3}
	 localparam Jaune=2*3 + 2;
	 localparam Blanc=0;
	 localparam EPAISSEUR_CADRE=3;
	 
	 always@(*) begin
		couleur=Blanc;
		if (hpos>=HVSpulseWidth+HVSfrontPorch 
			&& hpos<HVSpulseWidth+HVSfrontPorch+EPAISSEUR_CADRE
			&& vpos>=VVSpulseWidth+VVSfrontPorch
			&& vpos<VVSpulseWidth+VVSfrontPorch+VDisplayTime)
				couleur=Jaune;
		if (hpos>=HVSpulseWidth+HVSfrontPorch+HDisplayTime-EPAISSEUR_CADRE 
			&& hpos<HVSpulseWidth+HVSfrontPorch+HDisplayTime
			&& vpos>=VVSpulseWidth+VVSfrontPorch
			&& vpos<VVSpulseWidth+VVSfrontPorch+VDisplayTime)
				couleur=Jaune;
		if (vpos>=VVSpulseWidth+VVSfrontPorch+VDisplayTime-EPAISSEUR_CADRE
			&& vpos<VVSpulseWidth+VVSfrontPorch
			&& hpos>=HVSpulseWidth+HVSfrontPorch
			&& hpos<HVSpulseWidth+HVSfrontPorch+HDisplayTime)
				couleur=Jaune;
		/*if (vpos>=VVSpulseWidth+VVSfrontPorch+VDisplayTime-EPAISSEUR_CADRE
			&& vpos<VVSpulseWidth+VVSfrontPorch+VDisplayTime
			&& hpos>=HVSpulseWidth+HVSfrontPorch
			&& hpos<HVSpulseWidth+HVSfrontPorch+HDisplayTime)
				couleur=Jaune;*/
	 end

endmodule
