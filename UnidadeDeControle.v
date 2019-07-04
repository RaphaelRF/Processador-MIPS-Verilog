module UnidadeDeControle (OPcode, RW, MW, RDst, ASrc, MTG, PSrc, Jmp, Jr, ALUop, halt, Out,In);

	input [5:0] OPcode;
	output reg RW, MW, RDst, ASrc, MTG, PSrc, Jmp, Jr, halt, Out, In;
	output reg [4:0] ALUop;
	
	always @(*)
		begin
			case (OPcode)
				
                6'b000000: //add
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00000;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b000001: //addi
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00000;
							Out = 1'b0;
							In = 1'b0;					
						end
						
						6'b000010: //sub
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00001;	
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b000011: //subi
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00001;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b000100: //mod
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01110;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b000101: //beq
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01011;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b000110: //bne
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01000;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b000111: //bgt
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01010;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001000: //blt
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01001;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001001: //beqz
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01011;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001010: //bnez
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01000;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001011: //bgtz
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							halt = 1'b0;
							Jr = 1'b0;
							ALUop = 5'b01010;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001100: //mul
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01111;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001101: //jump
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'bx;
							PSrc = 1'b0;
							Jmp = 1'b1;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'bxxxxx;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001110: //jr
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'bx;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b1;
							halt = 1'b0;
							ALUop = 5'bxxxxx;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b001111: //load
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b1;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00000;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b010000: //ldi
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00000;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b010001: //store
						begin
							RW = 1'b0;
							MW = 1'b1;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00000;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b010010: //slt
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01001;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b010011: //slti
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01001;
							Out = 1'b0;
							In = 1'b0;
						end
						
						
						6'b010100: //and
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00011;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b010101: //or
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00100;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b010110: //xor
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00101;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b011001: //shl
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'bx;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00110;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b011010: //shr
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'bx;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00111;	
							Out = 1'b0;
							In = 1'b0;
						end
						
						
						6'b011011: //nop
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'bxxxxx;	
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b011100: //halt
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b1;
							ALUop = 5'bxxxxx;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b011000: //out
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'bxxxxx;
							Out = 1'b1;
							In = 1'b0;
						end
						
						6'b010111: //in
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00000;
							Out = 1'b0;
							In = 1'b1;
						end
						
					6'b011110: //sgt
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01010;
							Out = 1'b0;
							In = 1'b0;
						end
						
					6'b011111: //sle
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01101;
							Out = 1'b0;
							In = 1'b0;
						end
						
					6'b100000: //sge
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b01100;
							Out = 1'b0;
							In = 1'b0;
						end
						
						
					6'b100001: //div
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b10000;
							Out = 1'b0;
							In = 1'b0;
						end
						
						6'b011101: //move
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							halt = 1'b0;
							ALUop = 5'b00000;
							Out = 1'b0;
							In = 1'b0;	
						end
						
						
					default: 
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							ALUop = 5'b00000;
							halt = 1'b0;
							Out = 1'b0;
							In = 1'b0;
						end
						
				endcase
				
			end
endmodule			