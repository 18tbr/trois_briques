`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:13 10/30/2019 
// Design Name: 
// Module Name:    Manette 
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
module Manette(
    input boutonPlus, // Enables to move the brick to the right
    input boutonMoins, // Idem to the left
    input [2:0] hauteurGauche, // Height of the left-most stack
    input [2:0] hauteurDroite, // Idem for the right-most stack
    input [2:0] hauteurCentre, // Idem for the central stack
    input [2:0] row, // Brick's height, input from another module
    input reset, // Puts the system in a well-known state
    input clk, // Monitors the system
    output [1:0] Col // Represent the current brick's column
    );

    localparam LARGEUR_BRIQUE = 210; // Not used here
    localparam LARGEUR_ECRAN = 640;  // Not used here
    localparam ROW_COUNT = 6;

    reg [1:0] intern_column = 1; // reg variables for code validity
    reg button_pressed = 0; // Internal value used to register that the input was already registered once, in order to avoid the same input being processed during each clock cycle.
    // reg error_command = 0;


    always @(posedge clk) begin
        if (reset) begin // Central colum and no error
            intern_column = 1;
            // error_command = 0;
        end
        else begin
            if (~button_pressed) begin
                if (boutonPlus && ~boutonMoins) begin
                    if (intern_column == 1 && row < (ROW_COUNT - hauteurDroite)) begin // If the brick is located in the central column, the user wants it to go on the right, and the brick isn't below the right stack, there it goes.
                        intern_column = 2;
                        // error_command = 0;
                    end
                    else if (intern_column == 0 && row < (ROW_COUNT - hauteurCentre)) begin
                        intern_column = 1;
                        // error_command = 0;
                    end
                    // else error_command = 1;
                end
                else if (boutonMoins && ~boutonPlus) begin
                    if (intern_column == 1 && row < (ROW_COUNT - hauteurGauche)) begin
                        intern_column = 0;
                        // error_command = 0;
                    end
                    else if (intern_column == 2 && row < (ROW_COUNT - hauteurCentre)) begin
                        intern_column = 1;
                        // error_command = 0;
                    end
                    // else error_command = 1;
                end
            end
            button_pressed = (boutonPlus || boutonMoins);
        end
    end
    
    assign Col = intern_column;
endmodule