`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:23:38 10/23/2019 
// Design Name: 
// Module Name:    Score 
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
module Score(
    input aligne,
    input perdu,
	 input enable
    input reset,
    input clk,
    output [6:0] Cathodes,
    output [3:0] Anodes
    );
	
	reg [3:0] unites; //utilisé pour les calculs
	reg [3:0] dizaines;
	reg [3:0] centaines;
	reg [3:0] milliers;
	
	reg [3:0] digit0; //utilisé par le module nombre
	reg [3:0] digit1;
	reg [3:0] digit2;
	reg [3:0] digit3;
	
	always @(posedge clk) begin
		if(reset) begin
			unites <= 0;
			dizaines <= 0;
			centaines <= 0;
			milliers <= 0;
		end else begin
		//gestion du nombre a afficher
			if (aligne) begin
				if(unites==9) begin
					unites <=0;
					if (dizaines ==9) begin
						dizaines <=0;
						if(centaines ==9) begin
							centaines <=0;
							if (milliers ==9) milliers <=0;
							else milliers <= milliers +1;
						end else centaines <= centaines +1;
					end else dizaines <= dizaines +1;	
				end else unites <= unites +1;
			end
		end
		
	end
	
	always @(perdu or unites or dizaines or centaines or milliers) begin
		if (perdu) begin
		//on affiche les codes pour les lettres en hexadecimale, avec 1 pour le I
			digit0 <= 13;
			digit1 <= 14;
			digit2 <= 1;
			digit3 <= 13;
		end else begin //on regarde les chiffres à ne pas afficher, on envoie 15 si c'est le cas (fonction Digit modifiée) sinon on envoie les chiffres attendus
			digit3 <= milliers;
			digit2 <= centaines;
			digit1 <= dizaines;
			digit0 <= unites;
			if(milliers==0) begin
				digit3 <= 15;
				if (centaines ==0) begin
					digit2 <=15;
					if (dizaines ==0) digit1 <=15;
				end
			end
		end
	end
	
	Number number(.clk(clk),.reset(reset),.enable(enable),.digit0(digit0),.digit1(digit1),.digit2(digit2),.digit3(digit3),.blank(0),.anodes(Anodes),.cathodes(Cathodes));

endmodule
