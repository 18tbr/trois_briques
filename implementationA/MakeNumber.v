`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:13 07/03/2018 
// Design Name: 
// Module Name:    MakeNumber 
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
module MakeNumber(
    input clk,
    input reset,
    input aligne,
	 input perdu,
	 output reg [3:0] digit0,
	 output reg [3:0] digit1,
	 output reg [3:0] digit2,
	 output reg [3:0] digit3,
    output reg [3:0] blank 
	 );

	wire carry1,carry2,carry3,NoUsed;
	wire [3:0]cnt1,cnt2,cnt3,cnt4;
	Counter #(.UPPER(10)) dig1(.clk(clk),.reset(reset),.enable(aligne),.cnt(cnt1),.carry(carry1));
	Counter #(.UPPER(10)) dig2(.clk(clk),.reset(reset),.enable(carry1),.cnt(cnt2),.carry(carry2));
	Counter #(.UPPER(10)) dig3(.clk(clk),.reset(reset),.enable(carry2),.cnt(cnt3),.carry(carry3));
	Counter #(.UPPER(10)) dig4(.clk(clk),.reset(reset),.enable(carry3),.cnt(cnt4),.carry(NoUsed));
	always @(*) begin
		if (reset) begin
			digit0 <= 0 ; digit1 <= 0 ; 
			digit2 <= 0 ; digit3 <= 0 ;
		end
		else if (~perdu)begin
			digit0 <= cnt1 ;
			digit1 <= cnt2 ;
			digit2 <= cnt3 ;
			digit3 <= cnt4 ;
		end
		else begin
			digit0 <= 4'hD ;
			digit1 <= 4'h1 ;
			digit2 <= 4'hE ;
			digit3 <= 4'hF ;
		end
	end
	
	always @(digit0 or digit1 or digit2 or digit3) begin
		blank =0 ;
		if (digit3 ==0) begin
			blank[3] = 1 ;
			if (digit2 ==0) begin
				blank[2] = 1 ;
				if (digit1 ==0) blank[1] = 1 ;
			end
		end
	end
	
endmodule
