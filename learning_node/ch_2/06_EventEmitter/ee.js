var eventEmitter = require('events').EventEmitter;
var counter = 0;

var em = new eventEmitter();

setInterval(() => {
  em.emit('timed', counter++)
}, 3000)

em.on('timed', (data) => {
  console.log('timed ', data);
});
