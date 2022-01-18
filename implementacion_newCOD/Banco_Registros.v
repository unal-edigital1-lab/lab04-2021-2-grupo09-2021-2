module Banco_Registros #(
parameter BIT_ADDR = 8,
parameter BIT_DATO = 4
)
(
input iClk,
input rst
);
reg [BIT_DATO-1:0] DATOS_MEMORIA [BIT_ADDR-1:0];  //8 DATOS DE 4 BITS
reg [BIT_DATO-1:0] MEMORIA_AUX_Q;
reg [BIT_DATO-1:0] MEMORIA_AUX_D;


assign oValoe = MEMORIA_AUX_Q;

reg [3:0] rCounter_D;
reg [3:0] rCounter_Q;



initial
	begin
		$readmenh("memoria.txt",DATOS_MEMORIA);
	end



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