// Three nested scopes in the code example

// Scope 1 – global scope

function foo(a) {
  // Scope 2 – inside of foo
  var b = a * 2;

  function bar(c) {
    // Scope 3 – inside of bar
    console.log(a, b, c);
  }

  bar(b * 3);
}

foo(2);

// function bar (scope 3) is completely contained within scope 2

// Scope look-ups stop once it finds the first match. Had there been a var c in the 
// foo scope console.log wouldn't of found it because there in a c inside of bar
