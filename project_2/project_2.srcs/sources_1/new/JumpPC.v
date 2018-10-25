`timescale 1ns / 1ps
module JumpPC(
	input [31:0] pc4,
	input [25:0] addr,  
	output reg [31:0] newaddr
);
	initial newaddr <= 0;
	always@(addr or pc4) begin
		newaddr[1:0]=2'b00;
		newaddr[27:2]=addr[25:0];
		newaddr[31:28]=pc4[31:28];
	end
endmodule