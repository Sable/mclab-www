###OVERVIEW
High-level scientific languages such as MATLAB and Python’s NumPy library are gaining
popularity among scientists and mathematicians. These languages provide many features
such as dynamic typing, high-level scientific functions etc. which allow easy prototyping.
However these features also inhibit performance of the code.
We present VeloCty, an optimizing static compiler for MATLAB and Python as a solution
to the problem of enhancing performance of programs written in these languages.
In most programs, a large portion of the time is spent executing a small part of the code.
Moreover, these sections can often be compiled ahead of time and improved performance
can be achieved by optimizing only these ‘hot’ sections of the code. VeloCty takes as input
functions written in MATLAB and Python specified by the user and generates an equivalent
C++ version. VeloCty also generates glue code to interface with MATLAB and Python. The
generated code can then be compiled and packaged as a shared library that can be linked
to any program written in MATLAB and Python. We also implemented optimisations to
eliminate array bounds checks, reuse previously allocated memory during array operations
and support parallel execution using OpenMP.
VeloCty uses the Velociraptor toolkit. We implemented a C++ backend for the Velociraptor
intermediate representation, VRIR, and language-specific runtimes for MATLAB and
Python. We have also implemented a MATLAB VRIR generator using the McLAB toolkit.
VeloCty was evaluated using 17 MATLAB benchmarks and 9 Python benchmarks. The
MATLAB benchmark versions compiled using VeloCty with all optimisations enabled were
between 1.3 to 458 times faster than the MathWorks’ MATLAB 2014b interpreter and JIT
compiler. Similarly, Python benchmark versions were between 44.11 and 1681 times faster
than the CPython interpreter.

##### Code Examples
Following are a examples in Python and MATLAB which are compiled to C++ VeloCty.

###### MATLAB examples. 

Babai Estimation Algorithm. 
	[MATLAB](https://gist.githubusercontent.com/sameerjagdale/216a9e47121ac5ca3dda/raw/79fdf8bd341888733646c52c8290988eb565bc8a/Matlab%20implementation%20of%20the%20Babai%20Benchmark). [VeloCty](https://gist.githubusercontent.com/sameerjagdale/b3b016c3786f565e5893/raw/ba0b7ac3ff583400993a146b5f7552a4e9d3da05/C++%20implementation%20of%20Babai)

###### Python Examples

Arc Distance. The function calculates the pairwise arc distance between all points in vectors A and B. 
	[Python](https://gist.githubusercontent.com/sameerjagdale/3d245ab01feaac09eb9b/raw/ddb51e4e7aaa2d0d174b8fb6fc797056e62cae3f/arc_distance.py)
	[VeloCty](https://gist.githubusercontent.com/sameerjagdale/8fe84eace8a7454e85b0/raw/99bee0e2ae220d9a54d2b1c39dfb02c582f84237/arc_distance.cpp)
