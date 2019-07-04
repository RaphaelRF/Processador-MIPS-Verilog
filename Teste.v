module Teste (clk, RW , MW , RDst , ASrc , MTG , PCSrc , Jmp , Jr
, ALUop , reset, halt);


input clk , RW , MW , RDst , ASrc , MTG , PCSrc , Jmp , Jr, halt , reset;
input [4:0] ALUop;
wire zero;
wire [9:0] adressIn;
wire [9:0] adressOut;
wire [31:0] Instruction;
wire [31:0] mMem;
wire [4:0] mInstr; 
wire [31:0] mAlu;
wire [31:0] rdData;
wire [31:0] ALUres;					
wire [31:0] mPC; 							
wire [31:0] mJump; 						
wire [31:0] mJr; 							
wire [31:0] data1, data2;
wire [31:0] ex16, ex26;

ContadordePrograma PC ( .clock(clk),
								.reset(reset),
								.halt(halt),
								.adressIn(adressIn),
								.adressOut(adressOut),
								.PCSrc(PCSrc),
								.zero(zero),
								.Jmp(Jmp),
								.Jr(Jr),
								.mJr(mJr));




MemInstrucoes IM 	(.adress(adressOut),
									.Instrucao(Instruction),
									.clock(clk));
									
BancoReg RB 			(.Reg1(Instruction[25:21]),
									.Reg2(Instruction[20:16]),
									.WriteRegister(mInstr),
									.WriteData(mMem),
									.RegWrite(RW),
									.ReadData1(data1),
									.ReadData2(data2),
									.clock(clk));
									
ALU OP 						(.OPcode(ALUop[4:0]),
									 .op1(data1),
									 .op2(mAlu),
									 .result(ALUres),
									 .shamt(Instruction[10:6]),
									 .zero(zero),
									 .clock(clk));
									 
MemDados DM				(.clock(clk),
									 .WriteData(data2),
									 .MemWrite(MW),
									 .DataMemoryOut(rdData),
									 .adress(ALUres));
								
MuxInstrucao MI			(.Reg1(Instruction[20:16]),
									 .Reg2(Instruction[15:11]),
									 .RegOut(mInstr),
									 .RegDst(RDst));
									 
	MuxAlu MA					(.Imediate(ex16),
									 .Reg(data2),
									 .MuxOut(mAlu),
									 .ALUSrc(ASrc));
									 
	MuxMemoria MM					(.ReadData(rdData),
									 .ALUresult(ALUres),
									 .MemToReg(MTG),
									 .MuxOut(mMem));
									 
	MuxPC MPC					(.PCInc(adressOut),
									 .JumpBranch(ex16),
									 .PCSrc(PCSrc),
									 .Zero(zero),
									 .MuxOut(mPC));
									 
	MuxJump MJMP				(.MPC(mPC),
									 .JumpAdress(ex26),
									 .Jump(Jmp),
									 .MuxOut(mJump));
									 
	MuxJumpReg MJR					(.MJ(mJump),
									 .Reg(data1),
									 .JumpReg(Jr),
									 .MuxOut(mJr));
									 
	Extensor16 EXT1	(.ExIn(Instruction[15:0]),
									 .ExOut(ex16));
									 
	Extensor26 EXT2	(.ExIn(Instruction[25:0]),
									 .ExOut(ex26));
								 
endmodule
									
