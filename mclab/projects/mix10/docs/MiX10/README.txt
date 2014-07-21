This is the artifact accompanying the paper titled “MiX10: Compiling MATLAB to
X10 for High performance”, submitted for evaluation to the AEC for OOPSLA
2014. 

It contains the following files and directories:

1. MiX10.jar : An executable jar file for the MiX10 compiler.  

2. library : It contains the package directories, simpleArrayLib and
regionArrayLib that should be used to replace the package directory generated
by default.  

3.  examples : Contain sample MATLAB programs that can be compiled by the
MiX10 compiler.  Note that for some of these programs, the generated code
might need minor syntactical tweaking by hand to be able to be compiled by the
X10 compiler.  

4. output : An empty directory that can be used as the output directory for
the generated code.  

5. languages : within the subdirectories of this directory is the incomplete
XML file required to make the MiX10 compiler work.   
