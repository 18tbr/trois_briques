`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:55:28 07/03/2018 
// Design Name: 
// Module Name:    impl_button 
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
module impl_button(
    input clk,
    input reset,
    input in,
    output out
    );

	wire link ;
	Button but(.clk(clk),.reset(reset),.pressed(in),.pulse(link));
	T_Flipflop tFlip(.clk(clk),.reset(reset),.t(link),.q(out));


endmodule
