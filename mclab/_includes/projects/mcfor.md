###Overview
The MATLAB-to-Fortran 95 compiler, McFor, is designed to translate MATLAB
programs that are focussed on scientific computations to efficient and reusable
Fortran code. The primary objective of this project is to apply static type
inference and transformation techniques to produce efficient Fortran code and
gain performance improvement over the current runtime execution environment.
The second objective is to explore the possibility of using the Fortran
language to simulate as many MATLAB language features as possible.

The McFor starts as a backend of the McLab system, and is developed by Jun Li
as part of his M.Sc. thesis. The McFor compiler uses McLab's front end,
including the MATLAB-to-Natlab translator, the Natlab Lexer and Parser. The
initial results show that the generated Fortran programs perform better than
corresponding MATLAB executions, with speedups on supported benchmarks ranging
from 1.16 to 102, depending on the characteristics of the program.

Anton Dubrau joins the project since the beginning. He has created number of
benchmarks and participated in the design of the compiler. His current research
is focussed on extending the compiler to support more MATLAB language features
and further improve the performance.

This project is now deprecated. 
