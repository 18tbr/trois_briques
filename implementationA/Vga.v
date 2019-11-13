`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:44:07 10/25/2019 
// Design Name: 
// Module Name:    Vga 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Vga sync singal and the pixel's balayage position producer
//                      Need improvement, should add a port called valid to informe the modules succeed
//                      And resolve all the out of scream probleme in this module
//								
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Vga(
    input reset,
    input enable,
    input clk,
    output reg Hsync,
    output reg Vsync,
    output [10:0] Hpos,
    output [10:0] Vpos
    );

    wire carry;
	 wire NoUsed;
	 reg [1:0] divid;
	 
	 localparam HsyncPulseTime=800;
	 //localparam HsyncPulseTime=10;
	 localparam HDisplayTime=640;
	 localparam HVSpulseWidth=96;
	 //localparam HVSpulseWidth=2;
	 localparam HVSfrontPorch=16;
	 localparam HVSbackPorch=48;
	 
	 localparam VsyncPulseTime=521;
	 //localparam VsyncPulseTime=10;
	 localparam VDisplayTime=480;
	 localparam VVSpulseWidth=2;
	 localparam VVSfrontPorch=10;
	 localparam VVSbackPorch=29;
	 
	 /*Counter #(.UPPER(HsyncPulseTime)) HsyncCnt(.clk(clk),.reset(reset),.enable(enable),.cnt(Hpos),.carry(carry));
	 
	 //Counter #(.UPPER(HsyncPulseTime*2)) Vsub(.clk(clk),.reset(reset),.enable(enable),.cnt(),.carry(carry));
	 Counter #(.UPPER(VsyncPulseTime)) VsyncCnt(.clk(clk),.reset(reset),.enable(carry),.cnt(Vpos),.carry());
	 */
	 
	 reg [10:0] regHCnt;
	 reg [10:0] regVCnt;
	 assign Vpos=regVCnt;
	 assign Hpos=regHCnt;
	 
	 always@(posedge enable)begin
		if(reset)
			regHCnt<=0;
		else if(regHCnt == HsyncPulseTime-1)
			regHCnt<=0;
		else 
			regHCnt<=regHCnt+1;
	 end
	 
	 always@(posedge enable)begin
		if(reset)
			regVCnt<=0;
		else if(regVCnt == VsyncPulseTime-1)
			regVCnt<=0;
		else if(regHCnt == HsyncPulseTime-1)
			regVCnt<=regVCnt+1;
		else
			regVCnt<=regVCnt;
	 end
	 
/*	 assign Hsync = (regHCnt < HVSpulseWidth) ? 1'b0: 1'b1;
	 assign Vsync = (regVCnt < VVSpulseWidth) ? 1'b0:1'b1;*/
	 
	 always@(*) begin
		if (Hpos<HVSpulseWidth)
			Hsync=0;
		else 	
			Hsync=1;
	 end
	 
	 always@(*) begin
		if (Vpos<VVSpulseWidth)
			Vsync=0;
		else 
			Vsync=1;
	 end
	


endmodule
