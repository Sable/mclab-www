###Overview
MATLAB is a dynamic numerical scripting language widely used by scientists,
engineers and students. While MATLAB's high-level syntax and dynamic types make
it ideal for prototyping, programmers often prefer using high-performance
static languages such as FORTRAN for their final distributable code. Rather
than rewriting the code by hand, our solution is to provide a tool that
automatically translates the original MATLAB program to an equivalent FORTRAN
program. There are several important challenges for automatically translating
MATLAB to FORTRAN, such as correctly estimating the static type characteristics
of all the variables in a MATLAB program, mapping MATLAB built-in functions,
and effectively mapping MATLAB constructs to equivalent FORTRAN constructs.

In this paper, we introduce Mc2FOR, a tool which automatically translates
MATLAB to FORTRAN. This tool consists of two major parts. The first part is an
interprocedural analysis component to estimate the static type characteristics,
such as the shape of arrays and the range of scalars, which are used to
generate variable declarations and to remove unnecessary array bounds checking
in the translated FORTRAN program. The second part is an extensible FORTRAN
code generation framework automatically transforming MATLAB constructs to
FORTRAN. This work has been implemented within the McLab framework, and we
demonstrate the performance of the translated FORTRAN code on a collection of
MATLAB 

###Built-in Functions
In Table 1, 2, 3 and 4, we list some mappings of arithmetic operators,
relational operators, logical operators and commonly used mathematical
built-ins from MATLAB to FORTRAN. Note that the left division (.\) in MATLAB
can be supported by swapping the operands of the operator and replacing the
operator with the right division operator (./), and the colon operator in
MATLAB can be supported by using an implied DO loop in an array constructor in
FORTRAN. For example, the expression var = 1 : 10 in MATLAB will be converted
to var = (/I, I=1, 10/) in FORTRAN. 

####TABLE 1: Mapping MATLAB arithmetic operators to FORTRAN

| MATLAB arithmetic operators    | FORTRAN arithmetic operators          |
|--------------------------------|---------------------------------------|
| + (addition or unary plus)     | +                                     |
| - (subtraction or unary minus) | -                                     |
| .* (multiplication)            | *                                     |
| ./ (right division)            | /                                     |
| .\ (left division)             | swap operands, then right division    |
| : (colon operator)             | implied DO loop in array constructors |
| .^ (power)                     | **                                    |
| .' (transpose)                 | TRANSPOSE                             |
| * (matrix multiplication)      | MATMUL/DOT_PRODUCT                    |

####Table 2: Mapping MATLAB relational operators to FORTRAN

| MATLAB relational operators   | FORTRAN relational operators |
|-------------------------------|------------------------------|
| < (less than)                 | .LT.                         |
| <= (less than or equal to)    | .LE.                         |
| > (greater than)              | .GT.                         |
| >= (greater than or equal to) | .GE.                         |
| == (equal to)                 | .EQ.                         |
| ~= (not equal to)             | .NE.                         |


####Table 3: Mapping MATLAB logical operators to FORTRAN

| MATLAB relational operators   | FORTRAN relational operators |
|-------------------------------|------------------------------|
| < (less than)                 | .LT.                         |
| <= (less than or equal to)    | .LE.                         |
| > (greater than)              | .GT.                         |
| >= (greater than or equal to) | .GE.                         |
| == (equal to)                 | .EQ.                         |
| ~= (not equal to)             | .NE.                         |


####Table 4: Directly mapping MATLAB commonly used mathematical built-ins to FORTRAN

| MATLAB built-ins | FORTRAN intrinsic functions |
|------------------|-----------------------------|
| sum              | SUM.                        |
| ceil             | CEILING                     |
| floor            | FLOOR                       |
| mod              | MODULO                      |
| rem              | MOD                         |
| round            | NINT                        |
| sin              | SIN                         |
| asin             | ASIN                        |
| sinh             | SINH                        |
| cos              | COS                         |
| acos             | ACOS                        |
| cosh             | COSH                        |
| tan              | TAN                         |
| atan             | ATAN                        |
| tanh             | TANH                        |
| exp              | EXP                         |
| log              | LOG                         |
| log10            | LOG10                       |
| sqrt             | SQRT                        |
| abs              | ABS                         |
| conj             | CONJG                       |
| min              | MIN                         |
| max              | MAX                         |
| length           | SIZE                        |
| numel            | SIZE                        |
| size             | SHAPE                       |


###Matrix Indexing In Matlab
A brief intro is available [here]({{ site.baseurl }}/projects/mc2for/mat_indexing.txt)
