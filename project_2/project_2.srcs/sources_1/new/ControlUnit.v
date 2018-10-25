`timescale 1ns / 1ps
module ControlUnit(
	input [5:0] Op,
	input Zero,
	output RegDst,
	output InsMemRW,
	output PCWre,
	output ExtSel,
	output DBDataSrc,
	output mWR,
	output mRD,
	output ALUSrcB,
	output ALUSrcA,
	output [1:0] PCSrc,
	output [2:0] ALUOp,
	output RegWre
);
	assign PCWre=(Op==6'b111111)?0:1;
    assign ALUSrcA=(Op==6'b011000)?1:0;
    assign ALUSrcB=((Op==6'b000001)||(Op==6'b010000)||(Op==6'b011011)||(Op==6'b100110)||(Op==6'b100111))?1:0;
    assign DBDataSrc=(Op==6'b100111)?1:0;
    assign RegWre=((Op==6'b110000)||(Op==6'b110001)||(Op==6'b100110)||(Op==6'b111000)||(Op==6'b111111))?0:1;
    assign InsMemRW=0;
    assign mRD=(Op==6'b100111)?0:1;
    assign mWR=(Op==6'b100110)?0:1;
    assign RegDst=((Op==6'b000001)||(Op==6'b010000)||(Op==6'b011011)||(Op==6'b100111))?0:1;
    assign ExtSel=(Op==6'b010000)?0:1;
    assign PCSrc[1]=(Op==6'b111000)?1:0;
    assign PCSrc[0]=((Op==6'b110000&&Zero==1)||(Op==6'b110001&&Zero==0))?1:0;
    assign ALUOp[2] = ((Op == 6'b010001) || (Op == 6'b011011) || (Op == 6'b110000) || (Op == 6'b110001)) ? 1 : 0;
    assign ALUOp[1] = ((Op == 6'b010000) || (Op == 6'b010010) || (Op == 6'b011000) || (Op == 6'b011011) || (Op == 6'b110000) || (Op == 6'b110001)) ? 1 : 0;
    assign ALUOp[0] = ((Op == 6'b000010) || (Op == 6'b010000) || (Op == 6'b010010) || (Op == 6'b110000) || (Op == 6'b110001)) ? 1 : 0;


endmodule