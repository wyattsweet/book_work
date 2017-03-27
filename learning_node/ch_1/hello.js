const http = require('http')
const fs = require('fs')
const url = require('url')

http.createServer((req, res) => {
  let name = url.parse(req.url, true).query.name

  if (name === undefined) name = 'world'

  res.writeHead(200, {'Content-Type': 'text/plain'})
  res.end(`Hello ${name}`)
}).listen(8124)

console.log('Server running on port 8124')
