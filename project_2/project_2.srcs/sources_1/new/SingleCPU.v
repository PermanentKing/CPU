`timescale 1ns / 1ps
module SingleCPU(
	input clk,
	input reset,
	output [7:0] addr_4,
	output [7:0] new_addr_4,
    output [7:0] rs_4,
    output [7:0] data1_4,
    output [7:0] rt_4,
    output [7:0] data2_4,
    output [7:0] result_4,
    output [7:0] DB_4	
);

    wire zero;
	wire [31:0] A,B,result;
	wire [2:0] ALUOp;
	wire mRD,mWR,RegDst,InsMemRW,PCWre,ExtSel,RegWre,DBDataSrc,ALUSrcA,ALUSrcB;
	wire [31:0] data1,data2,DataOut,command,extended,address,new_address,pc4,jump_addr,branch_addr,new_addr,DB;
	wire [2:0] ALuOp;
	wire [1:0] PCSrc;
	wire [4:0] WriteReg;
	
	
	AddPC2 add2(.pc4(pc4),.extend_result(extended),.newpc(branch_addr));
	
	ALU32 alu(.ALUopcode(ALUOp),.rega(A),.regb(B),.zero(zero),.result(result));
	
	ControlUnit controlunit(.Op(command[31:26]),.Zero(zero),.RegDst(RegDst),.InsMemRW(InsMemRW),.PCWre(PCWre),.ExtSel(ExtSel),.DBDataSrc(DBDataSrc),.mWR(mWR),.mRD(mRD),.ALUSrcB(ALUSrcB),.ALUSrcA(ALUSrcA),.PCSrc(PCSrc),.ALUOp(ALUOp),.RegWre(RegWre));
	
	extend ex(.datain(command[15:0]),.ExtSel(ExtSel),.result(extended));
	
	JumpPC jump(.pc4(pc4),.addr(command[25:0]),.newaddr(jump_addr));
	
	ChooseInputA inputA(.ALUSrcA(ALUSrcA),.ReadData1(data1),.sa(command[10:6]),.A(A));
	
	ChooseInputB inputB(.ALUSrcB(ALUSrcB),.ReadData2(data2),.extend_result(extended),.B(B));
	
	NextPC nextPC(.PCSrc(PCSrc),.outPC0(pc4),.outPC1(branch_addr),.outPC2(jump_addr),.nextPC(new_address));
	
	AddPC1 add1(.PC(address),.PC4(pc4));
	
	PC pc(.CLK(clk),.Reset(reset),.PC(new_address),.PCWre(PCWre),.IAddr(address));
	
	//数据储存模块
	RAM ram(.clk(clk),.address(result),.writeData(data2),.nRD(mRD),.nWR(mWR),.Dataout(DataOut));
	
	//选择要写入的寄存器，是rd还是rt
	ChooseReg choosereg(.RegDst(RegDst),.rt(command[20:16]),.rd(command[15:11]),.wr(WriteReg));
	
	//从寄存器中读取数据到data1和data2，或者将writedata存入writereg
	RegFile regfile(.CLK(clk),.RST(reset),.RegWre(RegWre),.ReadReg1(command[25:21]),.ReadReg2(command[20:16]),.WriteReg(WriteReg),.WriteData(DB),.ReadData1(data1),.ReadData2(data2));
	
	//数据输出
	DBoutput db(.result(result),.DataOut(DataOut),.DBDataSrc(DBDataSrc),.DB(DB));
	
	//读取文件中的指令，存入command
	RW rw(.InsMemRW(InsMemRW),.IAddr(address),.IDataOut(command));
	
	transTocut trsc(.address(address),.new_address(new_address),.rs(command[25:21]),.data1(data1),.rt(command[20:16]),.data2(data2),.result(result),.DB(DB),.addr_4(addr_4),.new_addr_4(new_addr_4),.rs_4(rs_4),.data1_4(data1_4),.rt_4(rt_4),.data2_4(data2_4),.result_4(result_4),.DB_4(DB_4));
	
endmodule


