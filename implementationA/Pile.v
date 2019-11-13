`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:55 10/27/2019 
// Design Name: 
// Module Name:    Pile 
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
module Pile(
    input plus,
    input moins,
    input reset,
    input clk,
    output reg [2:0] Hauteur
    );
	 
	 always @(posedge clk)begin
		if(reset)
			Hauteur<=0;
		else if (plus && moins)
			Hauteur<=Hauteur;
		else if (plus)
			Hauteur<=Hauteur+1;
		else if (moins)
			Hauteur<=Hauteur-1'b1;
		else
			Hauteur<=Hauteur;
	 end


endmodule
