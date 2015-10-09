McNumJS is a high-performance JavaScript library for numerical computations which provides an easy-to-use API like NumPy.
McNumJS makes use of TypedArrays which provide a mechanism for accessing data much more efficiently.
McNumJS uses implicitly typed objects specified by asm.js so that modern javascript engines can 
optimize the code more efficiently and provide higher performance. Compiler writers who target 
javascript language and other web developers or scientists can make use of this library for 
numeric computations on the web.

#### McNumJS Modules

|Module             | Description                                                       | Example properties/methods
|-------------------|-------------------------------------------------------------------|------------------------------------------
|Core               |Extends JavaScript typed arrays to provide multi-dimension support | shape, stride, size, get, set, index, map
|Generation         |Provides API to generate different matrices                        | zeroes, ones, random
|Unary Operations   |Creates Unary operation functions                                  | sum, average, sin, cos, fill
|Binary Operations  |Creates Binary operation functions                                 | add, subtract, multiply, divide

#### Examples
 
* Core Module

<script src="https://gist.github.com/sujaykathrotia/8e2ac7665cfdd35b8509.js"></script>

* Generation Module

<script src="https://gist.github.com/sujaykathrotia/bd23a55404c569f511aa.js"></script>

* Unary / Binary Operations

<script src="https://gist.github.com/sujaykathrotia/b4e4da451e6e2e693a57.js"></script>


#### Performance

* McnumJS vs. Regular JavaScript: (Higher is better)

<img src="img/mn-vs-nota.png" width="500" />

* McNumJS vs. JavaScript with typed arrays: (Lower is better)

<img src="img/mn-vs-js.png" width="500" />

* McNumJS vs. Compiled asm.js: (Lower is better)

<img src="img/mn-vs-asm.png" width="500" />

* McNumJS vs. C: (Lower is better)

<img src="img/mn-vs-c.png" width="500" />


#### Development

For the development, you will need to install following dependencies.

 * [NodeJS (with NPM)](https://nodejs.org/)
 * [Grunt](http://gruntjs.com/)

Run following command to install other dependencies:
```
npm install
```
To build and test the library, run following command:
```
grunt && grunt test
```
