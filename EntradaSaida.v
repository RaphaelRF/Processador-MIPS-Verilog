module EntradaSaida (data, out, clock,saida);

input [31:0] data;
input clock, out;
reg [31:0] ant;
output [31:0] saida;

always @ ( posedge clock )
begin
if(out)

ant = data;

end

assign saida = ant;
endmodule
