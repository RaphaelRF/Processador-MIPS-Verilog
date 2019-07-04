module UnidadeProcessamento (clkAUTO,reset,resultado1,resultado2,resultado3,resultado4,clock_1,clock_2,traco_display,entrada,check);


input clkAUTO, reset;
input [3:0] entrada;
wire RW , MW , RDst , ASrc , MTG , PCSrc , Jr, halt, Jmp, In, Out, clk;
wire [31:0] Saida;
wire [4:0] ALUop;
wire zero;
wire [9:0] adressIn;
wire [31:0] adressOut;
wire [31:0] Instruction;
wire [31:0] mMem;
wire [31:0] entrada2;
wire [4:0] mInstr; 
wire [31:0] mAlu;
wire [31:0] rdData;
wire [31:0] ALUres;					
wire [31:0] mPC; 							
wire [31:0] mJump; 						
wire [31:0] mJr; 							
wire [31:0] data3;
wire [31:0] data1,data2;
wire [31:0] ex16, ex26;
output wire [6:0] resultado1;
output wire [6:0] resultado2;
output wire [6:0] resultado3;
output wire [6:0] resultado4;
output wire [6:0] clock_1;
output wire [6:0] clock_2;
output wire [1:0] traco_display;

input check;
wire insinal;


temporizador temp (  .clockin(clkAUTO),
							.clockout(clk));			

						
UnidadeDeControle UC (  .OPcode(Instruction[31:26]),
								.RW(RW),
								.MW(MW),
								.RDst(RDst),
								.ASrc(ASrc),
								.MTG(MTG),
								.PSrc(PCSrc),
								.Jmp(Jmp),
								.Jr(Jr),
								.Out(Out),
								.In(In),
								.ALUop(ALUop[4:0]),
								.halt(halt));
								
assign insinal = (check ==0 && In==1) ? 1 : 0;
								
ContadordePrograma PC ( .clock(clk),
								.reset(reset),
								.insinal(insinal),
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
									.clockAUTO(clkAUTO),
									.clock(clk));
									
BancoReg RB 			(.Reg1(Instruction[25:21]),
									.Reg2(Instruction[20:16]),
									.WriteRegister(mInstr),
									.WriteData(mMem),
									.RegWrite(RW),
									.ReadData1(data1),
									.ReadData2(data2),
									.EntradaIN(entrada),
									.in(In),
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
									 .clockAUTO(clkAUTO),
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
								 
	EntradaSaida ES (.data(data1),
						  .out(Out),
						  .saida(Saida),
						  .clock(clk));
						  
	display_verilog (.entrada(Saida),
						  .clock_atual(adressOut),
						  .saida1(resultado1),
						  .saida2(resultado2),
						  .saida3(resultado3),
						  .saida4(resultado4),
						  .saida_clock1(clock_1),
						  .saida_clock2(clock_2),
						  .traco(traco_display));
endmodule
				
