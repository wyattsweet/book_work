// Example 3-1. Running a script for access to the global console

var vm = require('vm');

global.count1 = 100;
var count2 = 100;

var txt = 'if (count1 === undefined) var count1 = 0; count1++;' +
          'if (count2 === undefined) var count2 = 0; count2++;' +
          'console.log(count1); console.log(count2);';

var script = new vm.Script(txt);

// specify a filename which shows up in stack traces when the script is run
script.runInThisContext({filename: 'count.vm'});

console.log(count1);
console.log(count2);
