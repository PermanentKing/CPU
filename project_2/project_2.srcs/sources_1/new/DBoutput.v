`timescale 1ns / 1ps
module DBoutput(
	input [31:0] result,
	input [31:0] DataOut,
	input DBDataSrc,
	output reg [31:0] DB
);
	initial DB<=0;
	always @(result or DataOut or DBDataSrc)begin
		if(DBDataSrc==0)
			DB<=result;
		else 
			DB<=DataOut;		
	end
endmodule			