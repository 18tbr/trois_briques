`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:27:25 10/30/2019 
// Design Name: 
// Module Name:    Pile 
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
module Pile(
    input Plus,
    input Moins,
    input reset,
    input clk,
    output [2:0] Hauteur
    );
	 
    reg [2:0] intern_height = 0;
    reg button_pressed;
   
    always @(posedge clk) begin
        if (reset) intern_height = 0;
        else begin
            if (~button_pressed) begin
                if (Plus && ~Moins)	intern_height = intern_height + 1;
                else if (Moins && ~Plus && (intern_height > 0)) intern_height = intern_height - 1; // Becuse of issues in Pesanteur we have to add a safeguard here.
            end
            button_pressed = (Plus || Moins);
           
        end
    end
    assign Hauteur = intern_height;
endmodule

