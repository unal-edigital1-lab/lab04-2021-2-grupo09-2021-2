# lab04 Diseño de banco de Registro

Escriba la documentación respectiva 


Roberto Sanchez 


# Introduccion

El siguiente informe tiene como fin presentar la implemntacion de sistemas de registros en placa de desarrollo, el cual consiste un banco que lea y escriba y permita la escritura simultanea.


## Comprension del codigo implementado.

### 
```
module BancoRegistro #(      		 //   #( Parametros
         parameter BIT_ADDR = 8,  //   BIT_ADDR Número de bit para la dirección
         parameter BIT_DATO = 4  //  BIT_DATO  Número de bit para el dato
	)
	(
    // Direccion de los dos registros para lectura
    input [BIT_ADDR-1:0] addrRa,
    input [BIT_ADDR-1:0] addrRb,
    
    //Salidas de los registros
	  output [BIT_DATO-1:0] datOutRa,
    output [BIT_DATO-1:0] datOutRb,
    
    //Direccion de escritura de los registros 
	  input [BIT_ADDR:0] addrW,
    input [BIT_DATO-1:0] datW,
    
    
    // Enable del flip flop
	  input RegWrite,
    
    // Reloj para la sincronia de flanco de subida
    input clk,
    //reset
    input rst
    );

// La cantdiad de registros es igual a: 
localparam NREG = 2 ** BIT_ADDR;
  
//configuración del banco de registro 
reg [BIT_DATO-1: 0] breg [NREG-1:0];


assign  datOutRa = breg[addrRa];
assign  datOutRb = breg[addrRb];

always @(posedge clk) begin
	if (RegWrite == 1)
     breg[addrW] <= datW;
  end

endmodule

```
