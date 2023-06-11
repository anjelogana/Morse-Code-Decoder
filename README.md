Demo: https://youtu.be/3yiLp9g9Tgk

FPGA: Lattice ICE40 HX1K VQ100

In our VHDL design, we employed Look-Up Tables (LUTs) and D-Flip-Flop Registers to precisely identify alphanumeric letters corresponding to Morse Code sequences. 
These results were then displayed on a 7-segment display. By implementing sequential logic, we effectively controlled the clock and processed switch signals, enabling the generation and interpretation of Morse Code. 
Using VHDL programming in tools such as iCEcube2 and Lattice Diamond Programmer, we successfully programmed an FPGA to interact with switches, LEDs, and the 7-segment display, facilitating seamless input and output operations.