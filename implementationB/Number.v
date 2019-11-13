`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:29 07/02/2018 
// Design Name: 
// Module Name:    Number 
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
module Number(
    input clk,
    input reset,
    input enable,
    input [3:0] digit0,
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,
    input [3:0] blank,
    output [3:0] anodes,
    output [6:0] cathodes
    );

	wire blankCurr ;
	reg[1:0] rankCurr ; 
	reg[3:0] dataCurr ;

	assign blankCurr = reset | blank[rankCurr] ;

	Digit digit(.blank(blankCurr),.rank(rankCurr),.dataIn(dataCurr),.anodes(anodes),.cathodes(cathodes));
	
	always @(posedge clk) begin
		if (reset) rankCurr <= 0 ;
		else if (enable) rankCurr <= rankCurr +1 ;
	end
	
	
	always @(rankCurr or digit0 or digit1 or digit2 or digit3) begin
		case (rankCurr)
			0: dataCurr <= digit0;
			1: dataCurr <= digit1;
			2: dataCurr <= digit2;
			3: dataCurr <= digit3;
		endcase
	end

endmodule
