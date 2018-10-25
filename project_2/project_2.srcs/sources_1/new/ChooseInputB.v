`timescale 1ns / 1ps
module ChooseInputB(
	input ALUSrcB,
	input [31:0] ReadData2,
	input [31:0] extend_result,
	output reg [31:0] B
);
	always@(ALUSrcB or ReadData2 or extend_result) begin
		if(ALUSrcB==0)
			B<=ReadData2;
		else
			B<=extend_result;
	end
endmodule