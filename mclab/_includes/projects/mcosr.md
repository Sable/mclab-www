On-stack replacement (OSR) is a technique that allows a virtual machine to
interrupt running code during the execution of a function/method, to
re-optimize the function on-the-fly using an optimizing JIT compiler, and then
to resume the interrupted function at the point and state at which it was
interrupted. OSR is particularly useful for programs with potentially
long-running loops, as it allows dynamic optimization of those loops as soon as
they become hot.

[McOSR](http://www.sable.mcgill.ca/~nlamee/#McOSR) is a modular tool to support OSR in the LLVM compiler infrastructure.
This is an important step forward because LLVM is gaining popular support, and
adding the OSR capability allows compiler developers to develop new dynamic
techniques. In particular, it will enable more sophisticated LLVM-based JIT
compiler approaches. Indeed, other compiler/VM developers can use the tool
because it is a clean modular addition to the standard LLVM distribution.
Further, our approach is defined completely at the LLVM-IR level and thus does
not require any modifications to the target code generation.

The OSR implementation can be used by different compilers to support a variety
of dynamic optimizations. As a demonstration of our OSR approach, we have used
it to support dynamic inlining in McVM. McVM is a virtual machine for MATLAB
which uses a LLVM-based JIT compiler. MATLAB is a popular dynamic language for
scientific and engineering applications that typically manipulate large
matrices and often contain long-running loops, and is thus an ideal target for
dynamic JIT compilation and OSRs. Using our McVM example, we demonstrate
reasonable overheads for our benchmark set, and performance improvements when
using it to perform dynamic inlining. 
