`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:26:03 10/27/2019 
// Design Name: 
// Module Name:    Rgb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 0-27 decode to 3 regs
//								Need improvement, color's defination is bizarre
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Rgb(
    input [4:0] couleurPave,
    input [4:0] couleurCadre,
    input [4:0] couleurPesanteur,
    output  reg [2:0] rouge,
    output  reg [2:0] vert,
    output  reg [1:0] bleu
    );
	 
	 wire [2:0] r1,r2,r3;
	 wire [2:0] v1,v2,v3;
	 wire [1:0] b1,b2,b3;
	 
	 OneColorDecoder U1(.color(couleurPave),.rouge(r1),.vert(v1),.bleu(b1));
	 OneColorDecoder U2(.color(couleurPesanteur),.rouge(r2),.vert(v2),.bleu(b2));
	 OneColorDecoder U3(.color(couleurCadre),.rouge(r3),.vert(v3),.bleu(b3));
	 
	 always @(*) begin
		/*if( couleurPesanteur!=0)begin
			rouge=r1;
			vert=v1;
			bleu=b1;
		end
		else if( couleurPave!=0)begin
			rouge=r2;
			vert=v2;
			bleu=b2;
		end
		else if(couleurCadre !=0)begin
			rouge=r3;
			vert=v3;
			bleu=b3;
		end
		else begin
			rouge=0;
			vert=0;
			bleu=0;
		end*/
		rouge=0;
		vert=0;
		bleu=0;
		
		if (rouge==0 && vert==0 && bleu==0)begin
			rouge=r1;
			vert=v1;
			bleu=b1;
		end
		
		if (rouge==0 && vert==0 && bleu==0)begin
			rouge=r2;
			vert=v2;
			bleu=b2;
		end
		
		if (rouge==0 && vert==0 && bleu==0)begin
			rouge=r3;
			vert=v3;
			bleu=b3;
		end
	 end
	 

endmodule
