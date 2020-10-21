function shift(arr) {
  if (arr.length === 0) return undefined;
  let value = arr[0];
  for (let index = 0; index < arr.length - 1; index += 1) {
    arr[index] = arr[index + 1];
  }
  arr.length = arr.length - 1;
  return value;
}

let count = [1, 2, 3];
console.log(shift(count)); // 1
console.log(count); // [ 2, 3 ]
