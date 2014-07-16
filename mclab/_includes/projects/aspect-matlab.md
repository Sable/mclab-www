###Overview
AspectMatlab introduces key aspect-oriented features in a way that is both
accessible to scientists and where the aspect-oriented features concentrate on
array accesses and loops, the core computation elements in scientific programs.
Introducing aspects into a dynamic language such as Matlab also provides some
new challenges. In particular, it is difficult to statically determine
precisely where patterns match, resulting in many dynamic checks in the woven
code. AspectMatlab Compiler (amc) includes flow analyses which are used to
eliminate many of those dynamic checks.

