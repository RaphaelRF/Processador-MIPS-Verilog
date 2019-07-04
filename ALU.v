module ALU ( OPcode , op1 , op2 , result , shamt , zero, clock ) ;

 input [31:0] op1 , op2 ;
 input clock ;
 input [4:0] OPcode;
 input [4:0] shamt ;
 output reg [31:0] result ;
 reg [15:0] a , b ;
 output zero;

 always@ ( * )
 begin
 
 case ( OPcode )
 5'b00000 : result = op1 + op2 ; // soma
 5'b00001 : result = op1 - op2 ; // sub
 5'b00010 : result = ~ op1 ; // not
 5'b00011 : result = op1 & op2 ; //and
 5'b00100 : result = op1 | op2 ;//or
 5'b00101 : result = op1 ^ op2 ;//xor
 5'b00110 : result = op1 << shamt ;//shamt esq
 5'b00111 : result = op1 >> shamt ;//shamt dir
 5'b01000 : result = op1 != op2 ? 1 : 0; // diferente
 5'b01001 : result = op1 < op2 ? 1 : 0; //menor
 5'b01010 : result = op1 > op2 ? 1 : 0;//maior
 5'b01011 : result = op1 == op2 ? 1: 0;//igual
 5'b01100 : result = op1 >= op2 ? 1 : 0;//maior igual
 5'b01101 : result = op1 <= op2 ? 1 : 0;//menor igual
 5'b01110 : result = op1 % op2;//mod
 5'b01111 : result = op1 * op2;//mult
 5'b10000 : result = op1 / op2;//div
 default : result = 1'b0;
 endcase
 end


 assign zero = result ;

 endmodule