`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:46 10/27/2019 
// Design Name: 
// Module Name:    BaseDeTemps 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 3 enable pulse generators
//                      need verify via oscillescope
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
	 
	 TimeUnit #(.FREQ_WANTED(25000000)) U1(.clk(clk),.reset(reset),.pulse(pulse));
	 TimeUnit #(.FREQ_WANTED(20000))       U2(.clk(clk),.reset(reset),.pulse(sevenSeg));
	 TimeUnit #(.FREQ_WANTED(4))               U3(.clk(clk),.reset(reset),.pulse(tombeeBrique));


endmodule
