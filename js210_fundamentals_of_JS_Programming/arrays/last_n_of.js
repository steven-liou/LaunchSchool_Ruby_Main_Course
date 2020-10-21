function lastNOf(arr, count) {
  return arr.slice(-count);
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3)); // returns [16, 23, 42]

console.log(digits.slice(digits.length - 3));
