function firstNOf(arr, count) {
  let result = [];

  for (let index = 0; index < count; index++) {
    result[index] = arr[index];
  }
  return result;
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3)); // returns [4, 8, 15]
// equivalent to
// digits.slice(0, 3);
