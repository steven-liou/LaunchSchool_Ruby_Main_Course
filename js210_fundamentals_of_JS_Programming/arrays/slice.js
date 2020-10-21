function slice(arr, start, end) {
  let subArray = [];
  for (let index = start; index < end; index += 1) {
    subArray.push(arr[index]);
  }
  return subArray;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2)); // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3)); // [ 'b', 'c' ]

