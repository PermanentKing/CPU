`timescale 1ns / 1ps

module NextPC(
    input [31:0] outPC0,
    input [31:0] outPC1,
    input [31:0] outPC2,
    input [1:0] PCSrc,
    output reg [31:0] nextPC
);
    initial nextPC <= 0;
    always@(PCSrc or outPC0 or outPC1 or outPC2)
    begin
        case(PCSrc)
            2'b00: nextPC = outPC0;
            2'b01: nextPC = outPC1;
            2'b10: nextPC = outPC2;
            //default nextPC = 0;
        endcase
    end
endmodule