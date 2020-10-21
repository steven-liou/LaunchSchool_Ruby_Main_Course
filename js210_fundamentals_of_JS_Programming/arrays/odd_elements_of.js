function oddElementsOf(arr) {
  let result = [];
  for (let index = 1; index < arr.length; index += 2) {
    result.push(arr[index]);
  }
  return result;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits)); // returns [8, 16, 42]
