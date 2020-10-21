function shift(array) {
  if (array.length === 0) return undefined;
  let firstEle = array[0];
  for (let index = 0; index < array.length - 1; index++) {
    array[index] = array[index + 1];
  }

  array.length -= 1;
  return firstEle;
}

function unshift(array, ...args) {
  let finalLength = array.length + args.length;
  for (let index = finalLength - 1; index >= 0; index--) {
    array[index] = array[index - 1];
  }

  for (let index = 0; index < args.length; index++) {
    array[index] = args[index];
  }
  return array.length;
}

console.log(shift([1, 2, 3])); // 1
console.log(shift([])); // undefined
console.log(shift([[1, 2, 3], 4, 5])); // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6)); // 5
console.log(unshift([1, 2, 3])); // 3
console.log(unshift([4, 5], [1, 2, 3])); // 3

const testArray = [1, 2, 3];
console.log(shift(testArray)); // 1
console.log(testArray); // [2, 3]
console.log(unshift(testArray, 5)); // 3
console.log(testArray); // [5, 2, 3]

console.log(unshift([1, 2, 3], 5, 6)); // 5
console.log(unshift([1, 2, 3])); // 3
console.log(unshift([4, 5], [1, 2, 3]));
