`timescale 1ns / 1ps
module PC(
	input CLK,
	input Reset,
	input [31:0] PC,
	input PCWre,
	output reg [31:0] IAddr
);
	initial IAddr<=0;
	always @(posedge CLK or negedge Reset)begin
		if(Reset==0) IAddr<=0;
		else if(PCWre) IAddr<=PC;
		else IAddr<=IAddr;
	end
endmodule