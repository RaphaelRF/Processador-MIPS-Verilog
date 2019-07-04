 module Extensor26 ( ExIn , ExOut ) ;

 input [25:0] ExIn ;
 output reg [31:0] ExOut ;


 always @ (*)
 begin
 if ( ExIn [25])
 ExOut = {6 'b111111 , ExIn} ;
 else
 ExOut = {6 'b000000, ExIn} ;
 end

 endmodule
