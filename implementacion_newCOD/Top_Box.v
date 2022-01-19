module Top_Box(
BCD,
SSeg,
iEntrada_1,
iEntrada_2,
);
input [3:0] BCD;
input [BIT_DATO-1:0]iEntrada_1,
input [BIT_DATO-1:0]iEntrada_2,
input iClk,
input rst

output reg [6:0] SSeg;

Banco_Registros  BANCO_REGISTROS(

.iEntrada_1(iEntrada_1),
.iEntrada_2(iEntrada_2),
.iClk(iClk),
.rst(rst)

); /*Instanciamos un submódulo BancoRegistro y redefinimos sus
                      parámetros*/

endmodule
