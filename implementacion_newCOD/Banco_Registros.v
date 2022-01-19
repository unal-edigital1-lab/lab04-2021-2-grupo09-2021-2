module Banco_Registros #(
parameter BIT_ADDR = 2,
parameter BIT_DATO = 4
)
(

input [BIT_DATO-1:0]iEntrada_1,
input [BIT_DATO-1:0]iEntrada_2,

input iClk,
input rst

output [BIT_DATO-1:0]oSalida_1,
output [BIT_DATO-1:0]oSalida_2,
);

assign DATOS_MEMORIA[0] =  iEntrada_1;  
assign DATOS_MEMORIA[1] =  iEntrada_2; 


reg [BIT_DATO-1:0] DATOS_MEMORIA [BIT_ADDR-1:0];  //2 DATOS DE 4 BITS
reg [BIT_DATO-1:0] MEMORIA_AUX_Q;
reg [BIT_DATO-1:0] MEMORIA_AUX_D;


assign oSalida_1 = DATOS_MEMORIA[0];
assign oSalida_2 = DATOS_MEMORIA[1];


assign oValoe = MEMORIA_AUX_Q;

reg [3:0] rCounter_D;
reg [3:0] rCounter_Q;



//initial
//	begin
//		$readmenh("memoria.txt",DATOS_MEMORIA);
//	end



always @(posedge iClk)
	begin 
		MEMORIA_AUX_Q <= MEMORIA_AUX_D;
		rCounter_Q <= rCounter_D;
	end

 

always @*
	begin
		MEMORIA_AUX_D = DATOS_MEMORIA[rCounter_Q];
		rCounter_D = rCounter_Q + 2'd1;
	end



endmodule
