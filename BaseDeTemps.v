`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:22:47 10/23/2019 
// Design Name: 
// Module Name:    BaseDeTemps 
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
module BaseDeTemps(
    input reset,
    input enable,
    input clk,
    output pulse,
    output sevenSeg,
    output tombeeBrique
    );
	 
	 TimeUnitEnable #(.FREQ_CLK(50000000),.FREQ_WANTED(25000000)) TimeUnit1(.enable(enable),.reset(reset),.clk(clk),.pulse(pulse));
	 
	 TimeUnitEnable #(.FREQ_CLK(50000000),.FREQ_WANTED(20000)) TimeUnit2(.enable(enable),.reset(reset),.clk(clk),.pulse(sevenSeg));
	 
	 TimeUnitEnable #(.FREQ_CLK(50000000),.FREQ_WANTED(2)) TimeUnit3(.enable(enable),.reset(reset),.clk(clk),.pulse(tombeeBrique));

endmodule
