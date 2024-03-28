`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI 
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 27.03.2024 17:22:13
// Design Name: 
// Module Name: tb_top
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



module tb_top;
    // Parameters 
    parameter WIDTH = 6; 
    parameter CLK_PERIOD = 10; // Clock period in ns 
    // Inputs 
    reg clk, rst; 
    reg [WIDTH-1:0] dividend; 
    reg [WIDTH-1:0] divisor; 
    // Outputs 
    wire [WIDTH-1:0] quotient; 

    wire [WIDTH-1:0] remainder; 
    // Instantiate the module under test 
    top #( 
        .WIDTH(WIDTH) 
    ) dut ( 
        .clk(clk), 
        .rst(rst), 
        .dividend(dividend), 
        .divisor(divisor),
        .quotient(quotient), 
        .remainder(remainder) 
    ); 
    // Clock generation 
    always #((CLK_PERIOD / 2)) clk = ~clk; 
    // Initializations 
    initial begin 
       // Initialize inputs 
        dividend = 8'd0; // Example dividend 
        divisor = 8'd0;  // Example divisor 
        clk = 0; 
        rst = 1; 
        # (10 * CLK_PERIOD); 
        @(negedge clk); 
        // De-assert reset 
        rst = 0; 
        @(posedge clk);
        dividend = 8'd13; // Example dividend 
        divisor = 8'd3;  // Example divisor 
        @(posedge clk); 
        dividend = 8'd10; // Example dividend 
        divisor = 8'd2;  // Example divisor 
        @(posedge clk); 
        dividend = 8'd17; // Example dividend 
        divisor = 8'd6;  // Example divisor 
        @(posedge clk); 
        dividend = 8'd18; // Example dividend 
        divisor = 8'd9;  // Example divisor 
        @(posedge clk);
        @(posedge clk);
        dividend = 8'd18; // Example dividend 
        divisor = 8'd5;  // Example divisor 
        @(posedge clk);     
        @(posedge clk);     
        dividend = 8'd19; // Example dividend 
        divisor = 8'd6;  // Example divisor 
        @(posedge clk); 
        dividend = 8'd6; // Example dividend 
        divisor = 8'd3;  // Example divisor 
        // Finish simulation 
//@(posedge clk); 
@(posedge clk); 
@(posedge clk); 
@(posedge clk); 
@(posedge clk); 
@(posedge clk);
 rst = 1;  
@(posedge clk); 
$finish; 
    end 
endmodule 

