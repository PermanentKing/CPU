`timescale 1ns / 1ps
module AddPC2(
	input [31:0] pc4,
	input [31:0] extend_result,
	output reg [31:0] newpc
);
	//reg [31:0] shift;
	initial begin
		newpc<=0;
		//shift<=0;
	end
	always@(pc4 or extend_result)begin
		//shift[1:0]=2'b00;
		//shift[31:2]=extend_result[29:0];
		newpc=(extend_result<<2)+pc4;
	end
endmodule