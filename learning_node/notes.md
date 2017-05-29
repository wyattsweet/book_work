# Learning Node Book Notes

## Chapter 1: The Node Environment

To discover V8 options you can run `$ node --v8-options`

`$ node --harmony` enables all completed harmony JavaScript features, including all ES6 functionality that's been implemented but not yet staged.


## Chapter 2: Node Building Blocks: Global Objects, Events, and Node's Asynchronous Nature

3 Global Objects in Node

1. Buffer
2. Global - In the browser when you create a global object, it's available everywhere. When you create a global object in Node it's restricted to the module or application. Global does share access to globally available objects and functions (such as the process object) across all environments.
3. Process: Provides a bridge between the Node Application and its runtime environemnt. Standard I/O occurs through process.

**The Process Object**

Standard streams are pre-established communication channels between application and the environment. They consist of: 

1. stdin
2. stout
3. sterr

In Node apps, these channels provide communication between the app and the terminal or a way for you to communicate directly with your applicaton. 

Node supports these channels with 3 process functions:

1. `process.stdin` 
2. `process.stdout`
3. `process.stderr`

These create a readable stream for each channel respectively that can be used in your app. You can receive input from `stdin` and write data to `stdout` and `stderr`.

The process I/O functions inherit from `EventEmitter`. The process incoming data with `process.stdin` first thing you need to do is set the encoding for the string `process.stdin.setEncoding('utf8')`.

**Buffers, Typed Arrays, and Strings**

