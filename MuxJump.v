module MuxJump (MPC, JumpAdress, Jump, MuxOut);

	input [31:0] MPC, JumpAdress;
	input Jump;
	output reg [31:0] MuxOut;
	
	always@(*)
		begin 
			if (Jump)
				MuxOut = JumpAdress;
			else
				MuxOut = MPC;
		end
	
endmodule 
