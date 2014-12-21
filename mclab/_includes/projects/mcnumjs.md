McNumJS is a high-performance JavaScript library for numerical computations which provides an easy-to-use API like NumPy.
McNumJS makes use of TypedArrays which provide a mechanism for accessing data much more efficiently.
McNumJS uses implicitly typed objects specified by asm.js so that modern javascript engines can 
optimize the code more efficiently and provide higher performance. Compiler writers who target 
javascript language and other web developers or scientists can make use of this library for 
numeric computations on the web.

#### Development

We have used sweet.js to create macros and compile it to normal JavaScript. We have created macros to extend typed arrays, iterate over array, create unary and binary operation functions, etc. McNumJS contains four modules which are defined in individual JavaScript file and corrosponding macro file.

We have used NodeJS and npm to automate development environment. After installing NodeJS and npm, use following command to install dependencies.

```
npm install
```

Use following command to concatenate and build the files:

```
grunt
```

We are using tape to test all the APIs provided by the library. Test files resides in test directory. Use following command to start test:

```
grunt test
```

#### McNumJS Modules

|Module             | Description                                                       | Example properties/methods
|-------------------|-------------------------------------------------------------------|------------------------------------------
|Core               |Extends JavaScript typed arrays to provide multi-dimension support | shape, stride, size, get, set, index, map
|Generation         |Provides API to generate different matrices                        | zeroes, ones, random
|Unary Operations   |Creates Unary operation functions                                  | sum, average, sin, cos, fill
|Binary Operations  |Creates Binary operation functions                                 | add, subtract, multiply, divide


