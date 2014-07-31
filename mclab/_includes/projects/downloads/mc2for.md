####Beta Release (April 20, 2014)

Hi, all, I am glad to release the beta version of Mc2For, a new
MATLAB-to-Fortran compiler. Since the project is implemented in Java, we render
the compiler in a jar package. Here is the link:

[Mc2For.jar](http://www.sable.mcgill.ca/mclab/projects/mc2for/Mc2For.jar) (One thing to remember: currently, we only support function files, not scripts.)

To run the compiler or view the help menu, you can type the command as "java
-jar Mc2For.jar -help". Since the first phase of the compiler is an
interprocedual analysis to infer the type information of all the variables in
order to declare them in the generated Fortran, if your MATLAB entry point
function has any input, please provide the type information of that input to
the compiler. For example, your entry point function has a real double scalar
variable as input, the type information of this variable should be represented
as "dble&1*1&REAL", where "&" is delimiter to separate different components of
the type information, like class, shape and isComplex. The example command to
run the compiler to translate MATLAB program to equivalent Fortran is "java
-jar Mc2For.jar -codegen my_entry.m -args "dble&1*1&REAL"".

There are numerous MATLAB built-in functions. Besides the commonly used
operators or built-in functions which have directly mappings in Fortran, we
have to write corresponing user-defined Fortran functions/subroutines to map
MATLAB built-ins. Here, to support our benchmarks, we have already written
several user-defined Fortran functions/subroutines. We put them in a
stand-alone Fortran library. Here is link to the source of the library and the
instruction to build the library.

[The stand-alone Fortran Library](http://www.sable.mcgill.ca/mclab/projects/mc2for/libmc2for/libmc2for.tar.gz)

Finally, we highly recommend that you start the compiler with some simple
MATLAB programs or our benchmarks, and after you are familiar with the
interface, command and features we supported, feel free to try the compiler
with your own code. Have fun!

###Availability of Mc2For

We are currently working on this new MATLAB-to-Fortran 95 translator, Mc2For.
We will distribute the first version of it when it is ready. You may request to
be put on a list for notification when Mc2FOR is ready by sending an e-mail to
[mclab-list@sable.mcgill.ca](http://www.sable.mcgill.ca/mclab/projects/mc2for/libmc2for/libmc2for.tar.gz).

It would be very helpful if you could also send the .m files for a typical
application that you would like to compile, along with some typical input data
for us to run the program. This will help us focus on the most important
features.

Meanwhile, we are still working on improving the implementation of Mc2For, but
you can check our source code on the [GitHub repository](https://github.com/Sable/mclab/tree/develop).

P.S. Because our tool works interprocedurally, when you send us the code,
please make sure, you send all the files of your project instead of segments of
the project. Thanks again for your interest in Mc2For and McLab.
