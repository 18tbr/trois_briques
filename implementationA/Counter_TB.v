`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:39:34 10/27/2019
// Design Name:   Counter
// Module Name:   /home/huzhanbo/ise/Briques/Counter_TB.v
// Project Name:  Briques
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Counter_TB;

	// Inputs
	reg clk;
	reg reset;
	reg enable;

	// Outputs
	wire [11:0] cnt;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.clk(clk), 
		.reset(reset), 
		.enable(enable), 
		.cnt(cnt), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		enable = 1;

		// Wait 100 ns for global reset to finish
		#100;
       reset=0;
		 #1000;
		 enable=0;
		 #100
		 enable=1;
		// Add stimulus here

	end
	
	always #10
		clk=~clk;
      
endmodule

