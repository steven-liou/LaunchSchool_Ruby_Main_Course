function unshift(arr, item) {
  for (let index = arr.length; index > 0; index -= 1) {
    arr[index] = arr[index - 1];
  }
  arr[0] = item;
  return arr.length;
}

let count = [1, 2, 3];
console.log(unshift(count, 0)); // 4
console.log(count); // [ 0, 1, 2, 3 ]
