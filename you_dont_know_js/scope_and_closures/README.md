# Notes

## Terms



**Chapter 2**

1. Scope
2. Lexical Scope – convention for scoping where a variable is referenced/called from the scope in which it is defined.
3. Scope look-ups – When the runtime engine is looking for a variable it always looks in the current scope, otherwise it looks up to the parent scope. If the variable is found in the current scope, the engine stops.
4. Shadowing – When the same variable name is used in two different scopes
5. Fist class indentifiers – foo.bar.baz, foo would be the first class identifier. Lexical Scope look-up only applies to first class identifiers.