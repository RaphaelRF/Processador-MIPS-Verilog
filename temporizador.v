module temporizador(clockin, clockout); 

   input clockin;
	output clockout;
	reg[31:0] cont;
	
	always@(posedge clockin)
		begin
			
			cont <= cont + 31'd1;
		end
		assign clockout = cont[21];
endmodule 