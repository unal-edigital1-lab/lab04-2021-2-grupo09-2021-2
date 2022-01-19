module visualizacion(

	 input [3:0] numero_1,
	 input [3:0] numero_2,
    input clk,
	 
    output [0:6] sseg_1,
	 output [0:6] sseg_2,
    output reg [3:0] an,
	 
	 //input [1:0]refreshcounter,
	 
	 input rst
)

BCDtoSSeg bcdtosseg_1(.BCD(bcd_1), .SSeg(sseg_1));
BCDtoSSeg bcdtosseg_2(.BCD(bcd_2), .SSeg(sseg_2));

always @(posedge refreshcounter)
	begin
		case(refreshcounter)
		
			2'h0:
				begin bcd_1 <= numero_1[3:0]; an<=4'b1110; end 
				
			2'h1: 
				begin bcd_1 <= numero_1[3:0]; an<=4'b1101; end 
				
			2'h2: 
				begin bcd_2 <= numero_1[3:0]; an<=4'b1011; end 
				
			2'h3: 
				begin bcd_2 <= numero_1[3:0]; an<=4'b0111; end 
			
		
	end

	
reg [23:0] contador_freq=0;    //para contar 16millones necesito 24bits

wire refreshcounter;

// Divisor de frecuecia

assign refreshcounter = contador_freq[16];

always @(posedge clk) 
	begin
	  if(rst == 0) 
			begin
				contador_freq <= 0;
			end 
		
		else
			begin
				contador_freq <=contador_freq+1;
			end
	end

endmodule