const http = require('http');

var server = http.createServer();

server.on('request', (req, res) => {
  console.log('request event');
  res.writeHead(200, {'content-type': 'text/plain'});
  res.end('hello world');
})

server.on('connection', (req, res) => {
  console.log('connection event');
})

server.listen(8124, () => {
  console.log('listening event');
})

console.log('server running on port 8124');
