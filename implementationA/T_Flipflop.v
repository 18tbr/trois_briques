`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:36 07/03/2018 
// Design Name: 
// Module Name:    T_Flipflop 
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
module T_Flipflop(
    input clk,
	 input reset,
    input t,
    output q
    );

	reg q_reg ;
	assign q = q_reg ;


	always @(posedge clk) begin
		if (reset) q_reg <= 0 ;
		else if(t) q_reg <=  ~q_reg ;
	end

endmodule
