`timescale 1ns / 1ps
module ALU32(
    input [2:0] ALUopcode,
    input [31:0] rega,
    input [31:0] regb,
    output reg [31:0] result,
    output zero  
    );
	initial result = 0;
    always @(ALUopcode or rega or regb) begin
        case(ALUopcode)
        3'b000: result <= rega + regb;  
        3'b001: result <= rega - regb;  
        3'b010: result <= regb << rega;  
        3'b011: result <= rega | regb;  
        3'b100: result <= rega & regb;   
        3'b101: result <= (rega < regb)?1:0;
        3'b110: result <= (((rega<regb) && (rega[31] == regb[31] ))||((rega[31] == 1&&regb[31]==0)))?1:0;
        3'b111: result <= rega ^ regb; 
        endcase  
   end     
       assign zero = (result==0)?1:0;
endmodule
