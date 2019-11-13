`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:53 10/27/2019 
// Design Name: 
// Module Name:    Score 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Score incremented when a aligne signal recived
//								Need verify the Cathodes nets width
//                      No TestBench for now
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
    input reset,
    input clk,
    output [6:0] Cathodes,
    output [3:0] Anodes
    );
	 
	wire pulse_refresh ;
	wire[3:0] digit3, digit2, digit1, digit0,blank;
	
	MakeNumber digitOut(.clk(clk),.reset(reset),.aligne(aligne),.perdu(perdu),.digit0(digit0),.digit1(digit1),
		.digit2(digit2),.digit3(digit3),.blank(blank));
	
	 TimeUnit timeUnit(.clk(clk),.reset(reset),.pulse(pulse_refresh));
   
	 Number number(.clk(clk),.reset(reset),.enable(pulse_refresh),.digit0(digit0),
						.digit1(digit1),.digit2(digit2),.digit3(digit3),.blank(blank),.anodes(Anodes),.cathodes(Cathodes));


endmodule
