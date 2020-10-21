function sortDescending(arr) {
  return arr.sort((a, b) => b - a);
}

let array = [23, 8, 16, 42, 4, 15];
let result = sortDescending(array); // returns [42, 23, 16, 15, 8, 4]
console.log(result); // logs    [42, 23, 16, 15, 8, 4]
console.log(array); // logs    [23, 4, 16, 42, 8, 15]
