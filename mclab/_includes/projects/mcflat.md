###Overview

MATLAB is the most commonly used for engineering and scientific applications.
Performance is at the heart of scientific and engineering computing. Tuning a
critical loop could lead to drastic reduction in running time of a large
scientific or engineering application. Performance improvement usually requires
tuning of the source code and compilers to produce the faster code.Data
dependence testing is the basic step in detecting loop level parallelism in
numerical programs. Analysis and transformation engine computes dependence for
the loop statements and applies various transformations to improve run time of
programs.In MatLab the loop bounds are mostly determined at run time,so the
profiler component of analysis and transformation engine generates data for
different runs of the program.The data is then passed to heuristic engine to
estimate appropriate ranges for loops in the progam. Dependence Analysis and
transformations are applied on the estimated ranges.The focus of my thesis is
to avoid expensive run time dependence analysis tests and do most of the
computations at compile time.
