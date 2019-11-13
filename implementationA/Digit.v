`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:59 07/02/2018 
// Design Name: 
// Module Name:    Digit 
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
module Digit(
    input [1:0] rank,
    input blank,
    input [3:0] dataIn,
    output reg [3:0] anodes,
    output reg [7:0] cathodes
    );

	always @(dataIn) begin
		case(dataIn)
			0: cathodes = 8'b11000000; 
			1: cathodes = 8'b11111001;
			2: cathodes = 8'b10100100;
			3: cathodes = 8'b10110000;
			4: cathodes = 8'b10011001; 
			5: cathodes = 8'b10010010; 
			6: cathodes = 8'b10000010;
			7: cathodes = 8'b11111000;
			8: cathodes = 8'b10000000;
			9: cathodes = 8'b10010000;
			10:cathodes = 8'b10001000;
			11: cathodes = 8'b10000011; 
			12: cathodes = 8'b11000110;
			13: cathodes = 8'b10100001;
			14: cathodes = 8'b10000110;
			15: cathodes = 8'b10001110;
		endcase
	end
	
	always @(rank or blank) begin
		anodes = 4'b1111 ;
		anodes[rank] = blank;
	end

endmodule
