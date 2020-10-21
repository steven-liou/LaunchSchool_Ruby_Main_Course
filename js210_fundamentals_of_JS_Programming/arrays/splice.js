function splice(arr, start, length) {
  let newLength = arr.length - length;

  let subArray = [];

  for (index = start; index < arr.length; index++) {
    if (index < start + length) {
      push(subArray, arr[index]);
    }
    arr[index] = arr[index + length];
  }

  arr.length = newLength;
  return subArray;
}

function slice(arr, start, end) {
  let subArray = [];
  for (let index = start; index < end; index += 1) {
    subArray.push(arr[index]);
  }
  return subArray;
}

function push(array, element) {
  array[array.length] = element;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5)); // [ 3, 4, 5, 6, 7 ]
console.log(count); // [ 1, 2, 8 ]

