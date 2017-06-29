exports.concatArr = function(str, arr) {
  return arr.map(function(element) {
    return str + ' ' + element;
  });
}
