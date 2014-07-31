###Overview
The matlab tamer is an open-source extensible objected-oriented framework,
implemented in Java. The overall goal of the system is to take Matlab programs
as input and produce output which is suitable for static compilation, a process
that we call Taming Matlab. Given a .m file as input, which is the entry point
to a program, the Matlab Tamer produces as output: (1) a Tame IR for all
functions (both user and library) which are reachable from the entry point, (2)
a complete call graph, and (3) an estimation of classes/types for all
variables.

There are some features in Matlab that are simply too "wild" to handle, and so
our system will reject programs using those features, and the user will need to
refactor their program to eliminate that feature. Thus, another important goal
in our work is to define as large as possible subset of M ATLAB that can be
tamed without user intervention.

Matlab includes a large set of builtin functions as part of the programming
language. These have non-standard semantics, due to Matlabs type system. We
provide a principled approach to dealing with all these builtin functions, and
defining their behavior so that programs can be completely analyzed. Some of
the research on builtins, and the specification of the builtins that are part
of the Matlab tamer, can be found below.

###Research on MATLAB
Our paper/technical report (see publications below) includes some research on
Matlab. In the following sections we show some of the tools and little projects
we used to find out about Matlabs behavior, and their full results.

####MATLAB Superior/Inferior Relationships
Matlab's builtin mclasses do have precedence relationships, even if they don't
appear to be documented. In order to find precendence relationships among
Matlabs builtin clases, we created a small program to that calls a function
with two arguments with every combination of Matlab classes as arguments. This
particular function is specialized for every Matlab class, so by finding out
which implementation Matlab actually executes when calling with two arguments,
we can find out whether the corresponding Matlab classes have a precedence
relaitonship between them. We found the following inferior/superior
relationships for Matlab classes (with transitive edges removed).

![Built In Class Relationships]({{ site.baseurl }}/images/projects/tamer/builtin-class-relationships.png)

You can download the small project that generates the result (using python,
Matlab, graphviz), [here](http://www.sable.mcgill.ca/mclab/projects/tamer/generateMatlabBuiltinClassRelationships.zip).


####MATLAB Builtin Function Usage
The mcbench framework allows us to search and analyze a large set of Matlab
programs. We have used it to find out about the usage of builtin functions.
I.e. we used the mcbench framework to find all calls in all sample projects,
with their associated frequencies (how often they were called), then used
matlabs exists function to find out which ones of those are builtins. The list
of all calls can be found here:
[calls.txt](http://www.sable.mcgill.ca/mclab/projects/tamer/calls.txt). When removing
all functions that are not builtins we get the following list of relevant
builtins, with their associated frequencies:
[builtins.txt](http://www.sable.mcgill.ca/mclab/projects/tamer/builtins.txt)


####Semantics of Bultins with respect to MATLAB Classes
Matlabs default numerical type is double. This means that in order to get an
integer, one has to explicitly cast a value to be an integer, because a
constant like 3 will be a double. In Matlab, an integer value is more special
than a double, so if one combines an integer and a double in an operation, the
result will be an integer. Generally Matlab has non-standard semantics for its
library. We created a small project that generates random values of given
Matlab types, and uses them as arguments to Matlabs library functions
(including operations). We then collect the Matlab types of the generated
outputs. This allows us to produces tables that for given input argument Matlab
classes, shows us what the result Matlab class is.

The result tables can be found [here](http://www.sable.mcgill.ca/mclab/projects/tamer/tables.txt).

Rows correspond to the mclass of the left operand, columns correspond to the
mclass of the right operand, and the table entries give the mclass of the
result. The labels i8 to i64 represent the classes int8 through int64, u8 to
u64 refer to the unsigned integers, f32 is single, f64 is double, rf32 and rf64
indicate arguments that were rounded to the nearest integer. c is char, and b
is logical, h is function handle, and {} is the empty cell array.

A prefix in the reults of "M" means the result was a matrix, for scalar
arguments, while prefix of "x" means the result was complex for real arguments.
Entries of the form “-” indicate that this combination is not allowed and will
result in a runtime error. "N/A", "bad" means that over different tests there
either errors, or inconsistent results, so no good results are available.

###Builtin Framework 
Our builtin framework allows the specification of Matlab builtin functions, their relationships (by defining them in a tree), and the behavior with respect to Matlab classes. More information can be found in the technical report below. In the following we have compiled the complete tree of all defined builtins, the specification used to create this tree (this specification includes comments explaining the domain-specific language used), and the domain-specific language used to specify Matlab class propgation information for builtin Functions.

Tree of all defined builtin functions: [tree.png](http://www.sable.mcgill.ca/mclab/projects/tamer/tree.png)
Builtin definition file: [builtins.csv](http://www.sable.mcgill.ca/mclab/projects/tamer/builtins.csv)
Definition of domain-specific language used in the above builtin definition
file to define the propagation of mclasses through builtins: [ClassPropagationlanguage.txt](http://www.sable.mcgill.ca/mclab/projects/tamer/ClassPropagationLanguage.txt)
