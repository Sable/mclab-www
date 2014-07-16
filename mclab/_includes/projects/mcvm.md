###Overview

The McVM virtual machine currently integrates an interpreter and an optimizing
JIT compiler supporting a non-trivial subset of the MATLAB programming
language. The primary objective of this project is to serve as a platform to
help researchers explore both static and dynamic optimization techniques for
dynamic scientific languages. A secondary objective of the project is to make
McVM a viable alternative implementation of the language for those who use
MATLAB for scientific computing.

The McVM virtual machine began its existence in 2008 as part of Maxime
Chevalier-Boisvert's M.Sc. thesis. Through this thesis, the foundations of the
virtual machine and optimizing JIT compiler were laid out. A novel type-driven
just-in-time function specialization system was also designed specifically for
the MATLAB language. Initial results have shown McVM to be very competitive
with the [GNU Octave](http://www.gnu.org/software/octave/) open source
implementation of MATLAB, and in many cases with the proprietary Mathworks
implementation.

Nurudeen Lameed joined the McVM project in 2009 as part of his Ph.D. One of his
contributions was to improve the performance of the JIT-compiled code with the
help of a bounds check elimination analysis. He has since taken over the
development of McVM and is currently working on developing new analyses and
compilation techniques to further improve the performance of the generated
code. Rahul Garg joined the project in 2009 and is focusing on effective JIT
compilation for multi-core and GPUs.
