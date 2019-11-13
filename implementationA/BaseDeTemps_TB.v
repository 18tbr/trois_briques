`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:20:56 10/27/2019
// Design Name:   BaseDeTemps
// Module Name:   /home/huzhanbo/ise/Briques/BaseDeTemps_TB.v
// Project Name:  Briques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BaseDeTemps
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BaseDeTemps_TB;

	// Inputs
	reg reset;
	reg enable;
	reg clk;

	// Outputs
	wire pulse;
	wire sevenSeg;
	wire tombeeBrique;

	// Instantiate the Unit Under Test (UUT)
	BaseDeTemps uut (
		.reset(reset), 
		.enable(enable), 
		.clk(clk), 
		.pulse(pulse), 
		.sevenSeg(sevenSeg), 
		.tombeeBrique(tombeeBrique)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		enable = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		
		#100000
		enable=0;
		#100
		enable=1;
        
		// Add stimulus here

	end
	
	always #10
		clk=~clk;
      
endmodule

