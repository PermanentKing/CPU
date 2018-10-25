`timescale 1ns / 1ps
module ChooseInputA(
	input ALUSrcA,
	input [31:0] ReadData1,
	input [4:0] sa,
	output reg [31:0] A
);
	initial A = 0;
	always@(ALUSrcA or sa or ReadData1) begin
		if(ALUSrcA==0)
			A<=ReadData1;
		else
		begin
			A[4:0]<=sa[4:0];
			A[31:5]<=0;
		end
	end
endmodule