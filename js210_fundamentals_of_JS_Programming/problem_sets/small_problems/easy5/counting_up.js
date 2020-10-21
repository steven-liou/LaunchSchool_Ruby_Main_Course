function sequence(number) {
  let result = [];
  for (let index = 1; index <= number; index += 1) {
    result.push(index);
  }
  return result;
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
