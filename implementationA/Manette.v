`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:24 10/27/2019 
// Design Name: 
// Module Name:    Manette 
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
module Manette(
    input boutonPlus,
    input boutonMoins,
    input [2:0]hauteurGauche,
    input [2:0]hauteurDroite,
    input [2:0]hauteurCentre,
    input [2:0]row,
    input reset,
    input clk,
    output reg [1:0] col
    );
	 
	 wire moveToRight,moveToLeft;
	 Button B1 (.clk(clk), .reset(reset),.pressed(boutonPlus), .pulse(moveToRight));
	 Button B2 (.clk(clk), .reset(reset),.pressed(boutonMoins), .pulse(moveToLeft));
	 
	 always@(posedge clk)begin
		if (reset) begin
			col<=1;
		end
		else begin
			case(col)
			0:if (moveToRight && row>hauteurCentre)  col<=1;
			1:if (moveToRight && row>hauteurDroite)  col<=2; else if (moveToLeft && row>hauteurGauche) col<=0;
			2: if (moveToLeft && row>hauteurCentre) col<=1;
			default:col<=1;
			endcase
		end
	 end


endmodule
