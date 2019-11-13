`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:36:18 10/27/2019 
// Design Name: 
// Module Name:    OneColorDecoder 
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
module OneColorDecoder(
    input [4:0] color,
    output reg [2:0] rouge,
    output reg [2:0] vert,
    output reg [1:0] bleu
    );
	 
	 reg [2:0] a;
	 reg [2:0] b;
	 reg [2:0] c;
	 always@(*)begin
		if (color<27 && color>=18)
			a=2;
		else if (color<18 && color>=9)
			a=1;
		else
			a=0;
		
		if (color-a*9<9 && color-a*9>=6)
			b=2;
		else if (color-a*9<6 && color-a*9>=3)
			b=1;
		else
			b=0;
		
		c = color-a*9-b*3;
		
		case(a)
		0:rouge=0;
		1:rouge=3;
		2:rouge=7;
		default: rouge=0;
		endcase
		
		case(b)
		0:vert=0;
		1:vert=3;
		2:vert=7;
		default: vert=0;
		endcase
		
		case(c)
		0:bleu=0;
		1:bleu=1;
		2:bleu=3;
		default: bleu=0;
		endcase
		
		if (color >=27)begin
			rouge=0;
			vert=0;
			bleu=0;
		end
	 end


endmodule
