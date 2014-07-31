In order for a compiler to perform optimizations or to provide
feedback to programmers, it must analyze the program source code. Making such
analyses easier to write requires a simple, well-defined Intermediate
Representation (IR) and analysis framework. This framework should also allow
new language extensions to use and adapt existing analyses. In spite of
MATLAB’s popularity, and the apparent need for static analysis, there has been
no publicly available framework for creating static analyses for the M ATLAB
programming language. The McLAB Static Analysis Framework, or McSAF is such a
framework. McSAF was created as part of the Mc L AB project to satisfy these
requirements. The goal of the framework is to make new analyses easy to write
and easy to extend to new language features.
