"use strict";

let str = 'New String';
new Buffer(str);

let buffer = new Buffer('This iss my fancy new string');
let json = JSON.stringify(buffer);
console.log(json);

// convert json buffer back to a string

let buf2 = new Buffer(JSON.parse(json).data);
console.log(buf2.toString());
