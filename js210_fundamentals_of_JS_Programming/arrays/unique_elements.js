function uniqueElements(arr) {
  let result = [];
  for (let index = 0; index < arr.length; index++) {
    let value = arr[index];
    if (result.indexOf(value) === -1) result.push(value);
  }
  return result;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4])); // returns [1, 2, 4, 3, 5]

