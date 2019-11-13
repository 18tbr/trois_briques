`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:23:09 10/29/2019
// Design Name:   TOP
// Module Name:   /home/huzhanbo/ise/TroisBriques/TOP_TB.v
// Project Name:  TroisBriques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TOP_TB;

	// Inputs
	reg clk;
	reg reset;
	reg leftButton;
	reg rightButton;

	// Outputs
	wire [6:0] cathodes;
	wire [3:0] anodes;
	wire [7:0] color;
	wire vSync;
	wire hSync;

	// Instantiate the Unit Under Test (UUT)
	TOP uut (
		.clk(clk), 
		.reset(reset), 
		.leftButton(leftButton), 
		.rightButton(rightButton), 
		.cathodes(cathodes), 
		.anodes(anodes), 
		.color(color), 
		.vSync(vSync), 
		.hSync(hSync)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		leftButton = 0;
		rightButton = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		
		#100;
		
		#10;
		leftButton=1;
		#500;
		leftButton=0;
		
		#10;
		leftButton=1;
		#500;
		leftButton=0;
		
		#10;
		rightButton=1;
		#500;
		rightButton=0;
		
		#10;
		rightButton=1;
		#500;
		rightButton=0;
		
		#10;
		rightButton=1;
		#500;
		rightButton=0;
		
		#10;
		rightButton=1;
		#50;
		rightButton=0;
		// Add stimulus here

	end
	
	always #10
		clk=~clk;
      
endmodule

