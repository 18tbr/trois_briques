`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:32 07/03/2018 
// Design Name: 
// Module Name:    Custom_number 
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
module Custom_number(
    input clk,
    input reset,
    input load,
    input [3:0] dataIn,
    output [3:0] anodes,
    output [7:0] cathodes
    );

	wire load_pulse, pulse_refresh ;
	wire[3:0] digit3, digit2, digit1, digit0,blank;
	
	MakeNumber digitOut(.clk(clk),.reset(reset),.dataIn(dataIn),.load(load_pulse),.digit0(digit0),.digit1(digit1),
		.digit2(digit2),.digit3(digit3),.blank(blank));
	
	 TimeUnit timeUnit(.clk(clk),.reset(reset),.pulse(pulse_refresh));
   
	 Number number(.clk(clk),.reset(reset),.enable(pulse_refresh),.digit0(digit0),
						.digit1(digit1),.digit2(digit2),.digit3(digit3),.blank(blank),.anodes(anodes),.cathodes(cathodes));

	
endmodule
