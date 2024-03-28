`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI 
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 28.03.2024 11:25:12
// Design Name: 
// Module Name: loop_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module loop_logic#( 
parameter WIDTH = 8 
)(
input [WIDTH-1 : 0] divisor, q,
input [WIDTH : 0] a, 
output reg [WIDTH : 0] a_next,
output reg [WIDTH-1 : 0] q_next

    );
 reg [WIDTH : 0] a1, a_nxt,b;    
 reg [WIDTH-1 : 0] q1;        
//always @(q or divisor) //Good logic:- inside generate block instance if some point of time q or divisor does not change then it will stuck at the same value.
always @(*)
if (divisor != 0)
begin	
    a1 = (a << 1) | q[WIDTH - 1];// accumulator left shift and lsb is replaced by q msb bu logical OR. -This operation performs a bitwise OR between corresponding bits of two operands.
    q1 = q << 1; // q left shift putting lsb 0.	
    b = a1;// storing a value to revert if a_nxt msb is 1
    a_nxt = a1 - divisor; //subtracted value  store in a_nxt
    
    if( a_nxt[WIDTH] ) //checking msb of a_nxt
    begin
    	a_next = b; //restoring value
    	q_next = q1 | 0; //changing q1 lsb with 0 which is already 0.  no need of this logic.  -->avoid latch
    end
    else
    begin
        a_next = a_nxt; //subtracted value 
    	q_next = q1 | 1'b1; //changing q1 lsb with 1 -This operation performs a bitwise OR between corresponding bits of two operands.
    end
end 
else
begin                   
    a_next = 'h0; 
	q_next = 'h0;
end                      
endmodule
