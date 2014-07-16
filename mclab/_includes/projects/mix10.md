### Overview
X10 (a recursive acronym for Mix10 Isn't X10) is an open MATLAB compiler that
ports MATLAB programs for efficient execution on high performance computing
systems by translating them to IBM's new-age high performance computing
languge, X10, which in turn compiles to more commonly used languages, C++ and
Java.

MATLAB is a very popular dynamic array-based language commonly used by
students, scientists and engineers, who appreciate the interactive development
style, the rich set of array operators, the extensive builtin library, and the
fact that they do not have to declare static types. Even though these users
like to program in MATLAB, their computations are often very compute-intensive
and are better suited for emerging high performance computing systems.

X10, on the other hand is an award-winning language designed for "Performance
and Productivity at Scale" and is well suited for emerging high performance
computing systems. X10 is based on four basic principles of asynchrony,
locality, atomicity, and order developed on a type-safe, class-based,
object-oriented foundation. The X10 compiler can generate C++ or Java code and
supports various communication interfaces including sockets and MPI for
communication between nodes on a parallel computing system.

With MiX10, our aim is to provide MATLAB's ease of use, to benefit from the
advantages of static compilation, and to expose scalable concurrency. MiX10
project makes it feasible for scientists and engineers to write programs in
MATLAB (or use existing programs already written in MATLAB), and at the same
time enjoy the benefits of high performance computing via the X10 system
without having to learn a new and unfamiliar language. Also, since the X10
compiler has back-ends that can produce both C++ and Java, MiX10 can also be
used by systems that use MATLAB for prototyping and C++ or Java for production.

MiX10 provides an efficient translation for sequential core of MATLAB by
addressing the challenges of: 1) Mapping programming constructs of a
matrix-based, dynamic and "wild" language to those of a statically typed and
object-oriented programming language, 2) Providing support for a huge number of
MATLAB builtin methods that are a major reason behind its success as a
scientific programming language and 3) Efficiently translating MATLAB matrices
to different kinds of X10 arrays. MiX10 also provides an effective bridge to
X10's concurrency features by 1) designing and implementing an effective
translation of MATLAB's parfor construct to X10, 2) Providing a way to execute
vectorized instructions concurrently and 3) By introducing concurrency
constructs in MATLAB analogous to those provided in X10, thus allowing users to
further specify fine-grained concurrency in their programs.

MiX10 is developed as a part of Vineet's M.Sc. thesis. He finally finished his
thesis in the Winter of 2014 with an "Excellent" review from the external
reviewer.

###IntegerOkay Analysis

One of the key contributions of the MiX10 project is the IntegerOkay analysis.
All the numbers in MATLAB are by default of type double. For a target language
like X10 (also C++ and Java), certain uses of numerical values, for instance,
as an array index, require the value to be of an integer type. A typecast
operation from double to integer is a costly operation due to the value checks
involved in it. The IntegerOkay analysis identifies those numerical values that
can be safely declared to be of an integer type at compile time. Read more
details about the analysis
[here](http://www.sable.mcgill.ca/mclab/mix10/thesis/thesis.html#Q1-1-64) or
just check out the algorithm
[here](http://www.sable.mcgill.ca/mclab/mix10/thesis/thesis.html#x1-420004).

###Evaluation
A detailed evaluation of the MiX10 compiler can be read [here](http://www.sable.mcgill.ca/mclab/mix10/thesis/thesis.html#Q1-1-78).
