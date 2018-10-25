`timescale 1ns / 1ps
module AddPC1(
	input [31:0] PC,
	output reg [31:0] PC4
); 
    initial PC4<=0;
	always @(PC)begin
		PC4=PC+4;
	end
endmodule
