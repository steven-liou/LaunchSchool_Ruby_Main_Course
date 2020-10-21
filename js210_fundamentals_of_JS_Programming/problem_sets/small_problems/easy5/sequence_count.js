function sequence(n, step) {
  let result = [];

  for (let nth = 0; nth < n; nth += 1) {
    result[nth] = (result[result.length - 1] || 0) + step;
  }
  return result;
}

console.log(sequence(5, 1));          // [1, 2, 3, 4, 5]
console.log(sequence(4, -7));         // [-7, -14, -21, -28]
console.log(sequence(3, 0));          // [0, 0, 0]
console.log(sequence(0, 1000000));    // []
