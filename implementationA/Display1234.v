`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:32 07/02/2018 
// Design Name: 
// Module Name:    Display1234 
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
module Display1234(
    input clk,
    input reset,
    output [3:0] anodes,
    output [7:0] cathodes
	 );
	 
	 wire pulse ;
	 
	 TimeUnit timeUnit(.clk(clk),.reset(reset),.pulse(pulse));
   
	 Number number(.clk(clk),.reset(reset),.enable(pulse),.digit0(4),
						.digit1(3),.digit2(2),.digit3(1),.blank(0),.anodes(anodes),.cathodes(cathodes));

	
	
	
endmodule
