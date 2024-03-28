`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI 
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 27.03.2024 16:47:43
// Design Name: 
// Module Name: top
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


module top #( 

parameter WIDTH = 2 

)( 
input clk, rst, 
input [WIDTH-1 : 0] dividend, 
input [WIDTH-1 : 0] divisor, 
output reg [WIDTH-1 : 0] quotient, 
output reg [WIDTH-1 : 0] remainder 
    ); 
  
wire [WIDTH : 0] a_next [WIDTH -1 : 0]; //width is +1 than dividend. Given in flow chart.  
wire [WIDTH-1 : 0] q_next [WIDTH -1 : 0] ; //width is same as dividend.   

genvar count;
//initial loop block
	loop_logic #(
			.WIDTH(WIDTH)
		) loop_logic0_inst (
			.divisor (divisor),
			.q       (dividend),
			.a       (0),// initial 0
			.a_next  (a_next[0]),
			.q_next  (q_next[0])
		);
//other loop block
generate for(count = 1; count <(WIDTH); count = count +1)// 1 to till WIDTH-1 loop.
begin:loop_logic
    	loop_logic #(
			.WIDTH(WIDTH)
		) inst_loop_logic (
			.divisor (divisor),
			.q       (q_next[count-1]),
			.a       (a_next[count-1]),
			.a_next  (a_next[count]),
			.q_next  (q_next[count])
		);
end
endgenerate

//output logic
always @(posedge clk, posedge rst)
	begin
		if( rst )
		begin
			quotient <= 0;
			remainder <= 0;
		end
		else
		begin
			quotient <= q_next[WIDTH -1];
			remainder <= a_next[WIDTH -1];
		end
	end

endmodule 

