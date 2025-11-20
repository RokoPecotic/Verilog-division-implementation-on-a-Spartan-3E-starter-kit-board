# Verilog-division-implementation-on-a-Spartan-3E-starter-kit-board
Implementation of division algorithm of two 8-bit numbers with the quotient and remainder shown on LED lights.
User inputs 4 upper bits of the dividend first, then the lower 4 bits using 4 switches on the board.
User repeats the same process for the divisor, and then hits the button which signals calculation from the software.
As the quotient and remainder is calculated it is presented on the 4 LED lights first showing 4 upper bits of the quotient,
then 4 lower bits of quotient after clicking the button again. The same is repeated to get remainder.
The division algorithm now allows users in Verilog to precisely calculate 8-bit numbers without using the "/" operator
which is unstable and very slow in Verilog.
