`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:52 10/25/2019 
// Design Name: 
// Module Name:    Counter 
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
module Counter(
    input clk,
    input reset,
    input enable,
    output reg [10:0] cnt,
    output carry
    );

    parameter  UPPER = 800;
	always @(posedge clk) begin
        if (reset) begin
            cnt<=0;
        end
        else if (enable)
            if  (cnt == UPPER-1) begin
                cnt <= 0;
            end
            else begin
                cnt <= cnt+1;
            end
    end
	 
	 assign carry = cnt==UPPER-1;

endmodule
