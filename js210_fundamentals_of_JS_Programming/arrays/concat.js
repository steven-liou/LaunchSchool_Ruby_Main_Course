function concat(arr1, arr2) {
  let totalLength = arr1.length + arr2.length;
  let combinedArray = [];

  for (let index = 0; index < totalLength; index += 1) {
    if (index < arr1.length) {
      push(combinedArray, arr1[index]);
    } else {
      push(combinedArray, arr2[index - arr1.length]);
    }
  }
  return combinedArray;
}

function push(array, element) {
  array[array.length] = element;
}

console.log(concat([1, 2, 3], [4, 5, 6])); // [ 1, 2, 3, 4, 5, 6 ]
