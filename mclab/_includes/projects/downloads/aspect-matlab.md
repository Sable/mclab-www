We are proud to release AspectMatlab++. 

New features in this release:
-Several new patterns: annotate, type, and dimension
-New functionality for around advice on loops with body keyword
-Improved code weaving strategies for better performance
-New GUI that can be called from within MATLAB

We also include several new general purpose aspects which aid with several tasks ranging from ensuring type safety to managing units.

How to use the compiler:
1.Download the [AspectMatlab compiler.](http://www.sable.mcgill.ca/mclab/projects/aspect-matlab/AspectMatlab.zip)
2.Extract amc.jar, along with the other files to a convenient location
3.Run the "RunAMC.m" function in Matlab.
4.Select the desired aspects to weave and the desired functions to weave, add them, and then press "Weave"
5.The woven code can be found in a newly created "weaved" directory

AspectMatlab reference guide to come shortly.
