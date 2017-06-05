// A program that uses event-based objects that inherits from EventEmitter

"use strict";

var util = require('util');
var eventEmitter = require('events').EventEmitter;
var fs = require('fs');

function InputChecker (name, file) {
  this.name = name;

  // creates a reference to a writeable stream
  this.writeStream = fs.createWriteStream('./' + file + '.txt', 
    { 'flags': 'a',
      'encoding': 'utf8',
      'mode': 0o666 }
  )
}

util.inherits(InputChecker, eventEmitter);

InputChecker.prototype.check = function check(input) {

  // trims extraneous white space
  let command = input.trim().substr(0,3);

  // process command
  // if wr, write input to file
  if (command == 'wr:') {
    this.emit('write', input.substr(3,input.length));
  // en, end process
  } else if (command == 'en:') {
    this.emit('end');
  } else {
    this.emit('echo', input);
  }
};

let ic = new InputChecker('Shelley', 'output')

ic.on('write', function(data) {
  this.writeStream.write(data, 'utf8');
});

ic.on('echo', function(data) {
  process.stdout.write(ic.name + ' wrote ' + data);
});

ic.on('end', function() {
  process.exit();
});

// capture input after setting encoding
process.stdin.setEncoding('utf8');
process.stdin.on('readable', function() {
  let input = process.stdin.read();
  if (input !== null) {
    ic.check(input);
  }
})
