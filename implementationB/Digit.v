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
    input [3:0] dataIn,
    input blank,
    output reg [3:0] anodes,
    output reg [6:0] cathodes
    );

	always @(dataIn) begin
		case(dataIn)
			0: cathodes = 8'b1000000; 
			1: cathodes = 8'b1111001;
			2: cathodes = 8'b0100100;
			3: cathodes = 8'b0110000;
			4: cathodes = 8'b0011001; 
			5: cathodes = 8'b0010010; 
			6: cathodes = 8'b0000010;
			7: cathodes = 8'b1111000;
			8: cathodes = 8'b0000000;
			9: cathodes = 8'b0010000;
			13: cathodes = 8'b0100001;
			14: cathodes = 8'b0000110;
			15: cathodes = 8'b1111111;
			default : cathodes = 8'b1111111;
		endcase
	end
	
	always @(rank or blank) begin
		anodes = 4'b1111 ;
		anodes[rank] = blank;
	end

endmodule
