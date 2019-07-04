module BancoReg ( Reg1 , Reg2 , WriteRegister , WriteData , RegWrite ,
ReadData1 , ReadData2 ,  clock, in, EntradaIN ) ;

 input [4:0] Reg1 , Reg2 , WriteRegister ;
 input [31:0] WriteData;
 input [3:0] EntradaIN;
 input RegWrite ,in, clock ;
 output [31:0] ReadData1 , ReadData2;
 reg [31:0] Registers [31:0];

 always @ ( posedge clock )
 begin
 Registers[0] = 0;
 
 if ( RegWrite )
 Registers [ WriteRegister ] = WriteData ;
 
 if(in)
 Registers[Reg1] = EntradaIN;
 
 
 end

 assign ReadData1 = Registers [ Reg1 ];
 assign ReadData2 = Registers [ Reg2 ];

 endmodule
