`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:54 10/23/2019 
// Design Name: 
// Module Name:    rgb 
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
module rgb(
    input [4:0] couleurPave,
    input [4:0] couleurCadre,
    input [4:0] couleurPesanteur,
    output [2:0] rouge,
    output [2:0] vert,
    output [1:0] bleu
    );
	 
	 //Brique pave(.Couleur(couleurPave);
	 //Cadre bord(.couleur(couleurCadre);
	 //Brique tetris(.Couleur(couleurPesanteur);
	 
	 reg[2:0] regRouge;
	 reg[2:0] regVert;
	 reg[1:0] regBleu;
	 
	 always @(couleurPave or couleurCadre or couleurPesanteur) begin
			case (couleurPave)	// CouleurPave has to come first or it will be overwritten by pesanteur 
				5'b00000 : begin
					case (couleurPesanteur)
						5'b00000 : begin
							case (couleurCadre)
								5'b00001 : begin
									regRouge <= 3'b000;
									regVert <= 3'b000;
									regBleu <= 2'b01;
									end
								5'b00010 : begin
									regRouge <= 3'b000;
									regVert <= 3'b000;
									regBleu <= 2'b11;
									end
								5'b00011 : begin
									regRouge <= 3'b000;
									regVert <= 3'b011;
									regBleu <= 2'b00;
									end
								5'b00100 : begin
									regRouge <= 3'b000;
									regVert <= 3'b011;
									regBleu <= 2'b01;
									end
								5'b00101 : begin
									regRouge <= 3'b000;
									regVert <= 3'b011;
									regBleu <= 2'b11;
									end
								5'b00110 : begin
									regRouge <= 3'b000;
									regVert <= 3'b111;
									regBleu <= 2'b00;
									end
								5'b00111 : begin
									regRouge <= 3'b000;
									regVert <= 3'b111;
									regBleu <= 2'b01;
									end
								5'b01000 : begin
									regRouge <= 3'b000;
									regVert <= 3'b111;
									regBleu <= 2'b11;
									end
								5'b01001 : begin
									regRouge <= 3'b011;
									regVert <= 3'b000;
									regBleu <= 2'b00;
									end
								5'b01010 : begin
									regRouge <= 3'b011;
									regVert <= 3'b000;
									regBleu <= 2'b01;
									end
								5'b01011 : begin
									regRouge <= 3'b011;
									regVert <= 3'b000;
									regBleu <= 2'b11;
									end
								5'b01100 : begin
									regRouge <= 3'b011;
									regVert <= 3'b011;
									regBleu <= 2'b00;
									end
								5'b01101 : begin
									regRouge <= 3'b011;
									regVert <= 3'b011;
									regBleu <= 2'b01;
									end
								5'b01110 : begin
									regRouge <= 3'b011;
									regVert <= 3'b011;
									regBleu <= 2'b11;
									end
								5'b01111 : begin
									regRouge <= 3'b011;
									regVert <= 3'b111;
									regBleu <= 2'b00;
									end
								5'b10000 : begin
									regRouge <= 3'b011;
									regVert <= 3'b111;
									regBleu <= 2'b01;
									end
								5'b10001 : begin
									regRouge <= 3'b011;
									regVert <= 3'b111;
									regBleu <= 2'b11;
									end
								5'b10010 : begin
									regRouge <= 3'b111;
									regVert <= 3'b000;
									regBleu <= 2'b00;
									end
								5'b10011 : begin
									regRouge <= 3'b111;
									regVert <= 3'b000;
									regBleu <= 2'b01;
									end
								5'b10100 : begin
									regRouge <= 3'b111;
									regVert <= 3'b000;
									regBleu <= 2'b11;
									end
								5'b10101 : begin
									regRouge <= 3'b111;
									regVert <= 3'b011;
									regBleu <= 2'b00;
									end
								5'b10110 : begin
									regRouge <= 3'b111;
									regVert <= 3'b011;
									regBleu <= 2'b01;
									end
								5'b10111 : begin
									regRouge <= 3'b111;
									regVert <= 3'b011;
									regBleu <= 2'b11;
									end
								5'b11000 : begin
									regRouge <= 3'b111;
									regVert <= 3'b111;
									regBleu <= 2'b00;
									end
								5'b11001 : begin
									regRouge <= 3'b111;
									regVert <= 3'b111;
									regBleu <= 2'b01;
									end
								5'b11010 : begin
									regRouge <= 3'b111;
									regVert <= 3'b111;
									regBleu <= 2'b11;
									end
								default : begin
									regRouge <= 3'b000;
									regVert <= 3'b000;
									regBleu <= 2'b00;
									end
							endcase
						end
						5'b00001 : begin
							regRouge <= 3'b000;
							regVert <= 3'b000;
							regBleu <= 2'b01;
							end
						5'b00010 : begin
							regRouge <= 3'b000;
							regVert <= 3'b000;
							regBleu <= 2'b11;
							end
						5'b00011 : begin
							regRouge <= 3'b000;
							regVert <= 3'b011;
							regBleu <= 2'b00;
							end
						5'b00100 : begin
							regRouge <= 3'b000;
							regVert <= 3'b011;
							regBleu <= 2'b01;
							end
						5'b00101 : begin
							regRouge <= 3'b000;
							regVert <= 3'b011;
							regBleu <= 2'b11;
							end
						5'b00110 : begin
							regRouge <= 3'b000;
							regVert <= 3'b111;
							regBleu <= 2'b00;
							end
						5'b00111 : begin
							regRouge <= 3'b000;
							regVert <= 3'b111;
							regBleu <= 2'b01;
							end
						5'b01000 : begin
							regRouge <= 3'b000;
							regVert <= 3'b111;
							regBleu <= 2'b11;
							end
						5'b01001 : begin
							regRouge <= 3'b011;
							regVert <= 3'b000;
							regBleu <= 2'b00;
							end
						5'b01010 : begin
							regRouge <= 3'b011;
							regVert <= 3'b000;
							regBleu <= 2'b01;
							end
						5'b01011 : begin
							regRouge <= 3'b011;
							regVert <= 3'b000;
							regBleu <= 2'b11;
							end
						5'b01100 : begin
							regRouge <= 3'b011;
							regVert <= 3'b011;
							regBleu <= 2'b00;
							end
						5'b01101 : begin
							regRouge <= 3'b011;
							regVert <= 3'b011;
							regBleu <= 2'b01;
							end
						5'b01110 : begin
							regRouge <= 3'b011;
							regVert <= 3'b011;
							regBleu <= 2'b11;
							end
						5'b01111 : begin
							regRouge <= 3'b011;
							regVert <= 3'b111;
							regBleu <= 2'b00;
							end
						5'b10000 : begin
							regRouge <= 3'b011;
							regVert <= 3'b111;
							regBleu <= 2'b01;
							end
						5'b10001 : begin
							regRouge <= 3'b011;
							regVert <= 3'b111;
							regBleu <= 2'b11;
							end
						5'b10010 : begin
							regRouge <= 3'b111;
							regVert <= 3'b000;
							regBleu <= 2'b00;
							end
						5'b10011 : begin
							regRouge <= 3'b111;
							regVert <= 3'b000;
							regBleu <= 2'b01;
							end
						5'b10100 : begin
							regRouge <= 3'b111;
							regVert <= 3'b000;
							regBleu <= 2'b11;
							end
						5'b10101 : begin
							regRouge <= 3'b111;
							regVert <= 3'b011;
							regBleu <= 2'b00;
							end
						5'b10110 : begin
							regRouge <= 3'b111;
							regVert <= 3'b011;
							regBleu <= 2'b01;
							end
						5'b10111 : begin
							regRouge <= 3'b111;
							regVert <= 3'b011;
							regBleu <= 2'b11;
							end
						5'b11000 : begin
							regRouge <= 3'b111;
							regVert <= 3'b111;
							regBleu <= 2'b00;
							end
						5'b11001 : begin
							regRouge <= 3'b111;
							regVert <= 3'b111;
							regBleu <= 2'b01;
							end
						5'b11010 : begin
							regRouge <= 3'b111;
							regVert <= 3'b111;
							regBleu <= 2'b11;
							end
						default : begin
							regRouge <= 3'b000;
							regVert <= 3'b000;
							regBleu <= 2'b00;
							end
					endcase
				end
				5'b00001 : begin
					regRouge <= 3'b000;
					regVert <= 3'b000;
					regBleu <= 2'b01;
					end
				5'b00010 : begin
					regRouge <= 3'b000;
					regVert <= 3'b000;
					regBleu <= 2'b11;
					end
				5'b00011 : begin
					regRouge <= 3'b000;
					regVert <= 3'b011;
					regBleu <= 2'b00;
					end
				5'b00100 : begin
					regRouge <= 3'b000;
					regVert <= 3'b011;
					regBleu <= 2'b01;
					end
				5'b00101 : begin
					regRouge <= 3'b000;
					regVert <= 3'b011;
					regBleu <= 2'b11;
					end
				5'b00110 : begin
					regRouge <= 3'b000;
					regVert <= 3'b111;
					regBleu <= 2'b00;
					end
				5'b00111 : begin
					regRouge <= 3'b000;
					regVert <= 3'b111;
					regBleu <= 2'b01;
					end
				5'b01000 : begin
					regRouge <= 3'b000;
					regVert <= 3'b111;
					regBleu <= 2'b11;
					end
				5'b01001 : begin
					regRouge <= 3'b011;
					regVert <= 3'b000;
					regBleu <= 2'b00;
					end
				5'b01010 : begin
					regRouge <= 3'b011;
					regVert <= 3'b000;
					regBleu <= 2'b01;
					end
				5'b01011 : begin
					regRouge <= 3'b011;
					regVert <= 3'b000;
					regBleu <= 2'b11;
					end
				5'b01100 : begin
					regRouge <= 3'b011;
					regVert <= 3'b011;
					regBleu <= 2'b00;
					end
				5'b01101 : begin
					regRouge <= 3'b011;
					regVert <= 3'b011;
					regBleu <= 2'b01;
					end
				5'b01110 : begin
					regRouge <= 3'b011;
					regVert <= 3'b011;
					regBleu <= 2'b11;
					end
				5'b01111 : begin
					regRouge <= 3'b011;
					regVert <= 3'b111;
					regBleu <= 2'b00;
					end
				5'b10000 : begin
					regRouge <= 3'b011;
					regVert <= 3'b111;
					regBleu <= 2'b01;
					end
				5'b10001 : begin
					regRouge <= 3'b011;
					regVert <= 3'b111;
					regBleu <= 2'b11;
					end
				5'b10010 : begin
					regRouge <= 3'b111;
					regVert <= 3'b000;
					regBleu <= 2'b00;
					end
				5'b10011 : begin
					regRouge <= 3'b111;
					regVert <= 3'b000;
					regBleu <= 2'b01;
					end
				5'b10100 : begin
					regRouge <= 3'b111;
					regVert <= 3'b000;
					regBleu <= 2'b11;
					end
				5'b10101 : begin
					regRouge <= 3'b111;
					regVert <= 3'b011;
					regBleu <= 2'b00;
					end
				5'b10110 : begin
					regRouge <= 3'b111;
					regVert <= 3'b011;
					regBleu <= 2'b01;
					end
				5'b10111 : begin
					regRouge <= 3'b111;
					regVert <= 3'b011;
					regBleu <= 2'b11;
					end
				5'b11000 : begin
					regRouge <= 3'b111;
					regVert <= 3'b111;
					regBleu <= 2'b00;
					end
				5'b11001 : begin
					regRouge <= 3'b111;
					regVert <= 3'b111;
					regBleu <= 2'b01;
					end
				5'b11010 : begin
					regRouge <= 3'b111;
					regVert <= 3'b111;
					regBleu <= 2'b11;
					end
				default : begin
					regRouge <= 3'b000;
					regVert <= 3'b000;
					regBleu <= 2'b00;
					end
			endcase
		end
	
	assign rouge = regRouge;
	assign vert = regVert;
	assign bleu = regBleu;
				
	 
	 
endmodule

