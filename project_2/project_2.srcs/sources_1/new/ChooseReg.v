`timescale 1ns / 1ps
module ChooseReg(
	input RegDst,
	input [4:0] rt,
	input [4:0] rd,
	output reg [4:0] wr
);
	initial wr<=0;
	always@(RegDst or rt or rd) begin
		wr=(RegDst==0)?rt:rd;
	end
endmodule