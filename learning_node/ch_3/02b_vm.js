// Specify a filename for the script object 

var vm = require('vm');

global.count1 = 100;
var count2 = 100;

var txt = 'count1++;' +
          'count2++;' +
          'console.log(count1); console.log(count2);';

var script = new vm.Script(txt, {filename: 'count.vm'});

try {
  script.runInThisContext();
} catch(err) {
  console.log(err.stack);
}

// when run error is printed with filename in trace
