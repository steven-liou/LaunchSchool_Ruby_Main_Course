// function isXor(var1, var2) {
//   return (var1 && !var2) || !!(!var1 && var2);
// }

function isXor(value1, value2) {
  return Boolean(value1) != Boolean(value2);
}

console.log(isXor(false, true)); // true
console.log(isXor(true, false)); // true
console.log(isXor(false, false)); // false
console.log(isXor(true, true)); // false

console.log(isXor(false, 3)); // true
console.log(isXor("a", undefined)); // true
console.log(isXor(null, "")); // false
console.log(isXor("2", 23)); // false
