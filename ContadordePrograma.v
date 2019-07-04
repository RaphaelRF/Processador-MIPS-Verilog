module ContadordePrograma ( clock , reset , halt , adressIn , adressOut , PCSrc ,
zero , Jmp , Jr , mJr, insinal ) ;

 input clock , reset , halt , PCSrc , zero , Jmp , Jr, insinal ;
 input [31:0] adressIn , mJr ;
 reg [31:0] adressOut ;
 wire [31:0] NovoPC , EndBranch ; 
 output [31:0] adressOut ;

 assign NovoPC = adressOut + 1;
 assign EndBranch = mJr ;

 always @ ( posedge clock )
 begin
 if ( reset )
 adressOut <= 0;
 else if ( halt )
 begin
 
 end
 
 else if(insinal==1)
 begin
 
 end
 
 else if (( PCSrc && zero ) || Jmp || Jr )
 begin
 adressOut <= EndBranch ;
 end
 else
 adressOut <= NovoPC ;
 end


 endmodule
