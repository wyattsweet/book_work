process.stdin.setEncoding('utf8');

console.log("Please enter some text or type 'exit' to exit");
process.stdin.on('readable', () => {
  var input = process.stdin.read();

  if (input !== null) {
    // echo the text
    process.stdout.write(input);

    var command = input.trim();
    if (command == 'exit') {
      process.exit(0);
    }
  }
}) 
