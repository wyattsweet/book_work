# Learning Node Book Notes

## Chapter 1: The Node Environment

To discover V8 options you can run `$ node --v8-options`

`$ node --harmony` enables all completed harmony JavaScript features, including all ES6 functionality that's been implemented but not yet staged.


## Chapter 2: Node Building Blocks: Global Objects, Events, and Node's Asynchronous Nature

3 Global Objects in Node

1. Buffer
2. Global - In the browser when you create a global object, it's available everywhere. When you create a global object in Node it's restricted to the module or application. Global does share access to globally available objects and functions (such as the process object) across all environments.
3. Process: Provides a bridge between the Node Application and its runtime environemnt. Standard I/O occurs through process.

###The Process Object

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

###Buffers, Typed Arrays, and Strings

**Buffers**

Buffers are a region in physical memory to temporarily store data while it is being moved from one place to another.

In browser based JavaScript there is something called an ArrayBuffer to handle binary data. It's an object used to represent a generic, fixed-length raw binary data buffer.

In Node the solution to this is Buffer. Node's buffer is the primary data structure used with most I/O. **The buffer is raw binary data that's been allocated outside the V8 heap.** Once allocated it can't be resized.

If `buffer.toString()` gets gets an incomplete sequence of UTF-8 characters it returns gibberish.
On the other hand `buffer.StringDecoder` buffers the incomplete sequence until it's complete, then returns the result. 

###Node's Callback and Asynchronous Event Handling
JavaScript is single threaded, making it inherintly synchronous meaning it executes line by line until the until the end. JS and Node use the event loop to handle asychronisity (versus the threaded approach). When a time consuming process is invoked the app goes on its merry way. The process with emit an event signaling when it's done. Any dependent functionality can subscribe to the event and get invoked with the event related data. This is usually done with callbacks or promises.

###EventEmitter

Anytime an object emits an event in node it's using EventEmitter. Understanding how EventEmitter works and how to use it are two important concepts of Node development. EventEmitter enables asynchronous event handling in Node.

Two essential tasks with EventEmitter are to attach an event handler and emit an actual event.

```js
var events = require('events')
// creates an instance of EventEmitter
var em = new events.EventEmitter();

// create an event handler. First parameter is the name of the event, second is the cb to perform some functionality
em.on('someevent', function(data) {...});

if (somecriteria) {
	// emit the event
	enm.emit('data');
}

```

In practice other objects need to inherit from EventEmitter. Another Node object `Util` has a method `Util.inherits()` allows one constructor to inherit the prototype methods of another, a superconstructor.

```js
var util = require('util');

// Creates the inheritance
util.inherits(Someobj, EventEmitter);

// Now you can call .on and .emit on Someobj
Someobj.prototype.someMethod = () => {
	thos.emit('event');
}

Someobjinstance.on('event', () => 'do something');
```

### The Node Event Loop and Timers

If you assign `setTimeout` to a variable you can cancel it by passing that variable to `clearTimeout`. `setInterval` can be passed to `clearInterval`. 

Node specific functions you can use which are returned when you call `setTimeout()` or `setInterval()`: 

- `ref()`: This keeps the program going until the timer has processed. 
- `unref()`: If a timer is the only event in the queue, this will cancel it.

Other Node specific timer-like functions

- `setImmediate()`: creates an event which has precedence over those created by `setTimeout()` or `setInterval()` but not I/O events.
- `clearImmediate()`

similar to `process.nextTick()` which is invoked once the current event loop is finished but before any new I/O events are added, used extensively to implement asynchronous functions in Node.

### Nested Callbacks and Exception Handling

When an error occurs in a callback, you can print the stack trace like so -

```
var fs = require('fs');

fs.readFile('./apple.txt', 'utf8', function(err, data) {
	if (err) {
		console.error(err);
	}
})
```

## Chapter 3: Basics of Node Modules and Node Package Manager (npm)

When requesting a new module into your application first Node checks to see if the module has been cached. Node caches the module the first time it's accessed.

If the module isn't cached Node checks to see if it's a native module. If it's a native module a function is used specifically for native.

If it's not native a new module object is created and the modules public facing functionality is returned to the application.

As part of loading the module, node has to resolve a location for it. First core modules have priority. You can call your module http but Node is going to load the native http module first (unless you supply a specific path). You don't need to supply a file extension, node will look for the following in order `.js` `.json` and `.node`.

If no path is provided it first looks in the `node_modules` directory of the project if it's not there it looks in the subdirectories `node_modules` directory and then the `node_modules` directory one level out. Finally, it looks for globally installed modules.

---

`Module.require()` calls another internal function `Module._load()`


###Sandboxing and the VM Module

If you need to execute an arbitrary chunk of JS in you Node app, you can do it using the VM module to sandbox the script. This isn't completely trustworthy though. The only safe way is to do it in a seperate process.

Scripts can be precompiled using the the vm.script object, or passed in as a function call to vm. THere are also 3 types of functions –

`script.runInNewContext()` or `vm.runInNewContext()` runs the script in the new context and the script doesn't have access to local variables or the global object. *see 02_vm.js*

`script.runInThisContext()` gives the script access to the global variables.

You can load in the code from a file, precompile and run in the sandbox - 

*see 03_loadInScript/*

`script.runInContext()` Takes a *contextualized* sandbox meaning the context must be explicitly created.

###An In-Depth Exploration of NPM