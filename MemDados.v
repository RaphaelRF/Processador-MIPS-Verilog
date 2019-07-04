module MemDados ( clock , WriteData , MemWrite , DataMemoryOut , adress, clockAUTO ) ;

 input [31:0] WriteData , adress ;
 input clock , clockAUTO, MemWrite ;
 output [31:0] DataMemoryOut ;

 reg [31:0] memory [255:0];
 reg[31:0] x;
 
 always @ ( negedge clock )
 begin
 if ( MemWrite )
 memory [ adress ] = WriteData ;
 end
 
 
 always @ ( negedge clockAUTO )
 begin
 x <= memory [ adress ];
 end
 

 assign DataMemoryOut = x;

 endmodule

