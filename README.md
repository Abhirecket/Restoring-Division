# Restoring Division
 ### RTL Description: Divider Module

- **Engineer**: Abhishek Kumar Kushwaha
- **Date Created**: March 27, 2024
- **Module Name**: top
- **Company**: College of VLSI
- **Revision**: Revision 0.01 - File Created

#### Overview:
This Verilog module `top` implements a divider that computes quotient and remainder of a division operation. It takes a clock signal (`clk`), a reset signal (`rst`), dividend (`dividend`), and divisor (`divisor`) as inputs, and outputs quotient (`quotient`) and remainder (`remainder`). The divider supports arbitrary bit-width for the dividend and divisor, specified by the `WIDTH` parameter.

#### Functional Description:
The divider module uses a sequential algorithm to perform the division operation. It first initializes a set of wires (`a_next` and `q_next`) to store intermediate values during the division process. The divider module consists of two blocks:
1. **Initial Loop Block**: This block initializes the division process and computes the first set of intermediate values.
2. **Other Loop Blocks**: These blocks iterate over the remaining bits of the dividend to compute the final quotient and remainder.

#### Dependencies:
This RTL design has no external dependencies.

#### Implementation Details:
- **Clock and Reset Handling**: The module synchronously resets the quotient and remainder registers on the positive edge of the clock (`clk`) or the positive edge of the reset signal (`rst`).
- **Divider Logic**: The division operation is implemented using a sequential algorithm. The divisor is subtracted from the dividend iteratively to compute the quotient and remainder.

#### Target Devices and Tool Versions:
This RTL design is intended to be synthesized and implemented on FPGA devices using Verilog synthesis tools such as Vivado.

#### Additional Comments:
- The `WIDTH` parameter specifies the bit-width of the dividend and divisor.
- The division process is sequential and may take multiple clock cycles to complete.
- This RTL design is a generic implementation of a divider and can be instantiated in larger designs for various applications.


  
 <h3 align="left">waveform:-</h3>
 <img width="818" alt="image" src="https://github.com/Abhirecket/Restoring-Division/assets/46784291/3ce84f91-d0f0-4f72-aaff-938847c20b77">


 <h3 align="left">schematic:-</h3> 
 <img width="599" alt="image" src="https://github.com/Abhirecket/Restoring-Division/assets/46784291/a06ed385-9412-4d3f-9c1d-2e408400ca75">


 
