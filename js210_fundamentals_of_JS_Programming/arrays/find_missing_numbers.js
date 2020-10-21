// function missing(arr) {
//   let misses = [];

//   for (let index = 1; index < arr.length; index++) {
//     let preValue = arr[index - 1];
//     let curValue = arr[index];
//     if (curValue - preValue === 1) continue;

//     for (let miss = preValue + 1; miss < curValue; miss++) {
//       misses.push(miss);
//     }
//   }
//   return misses;
// }

// function missing(arr) {
//   let misses = [];
//   let start = arr[0] + 1;
//   let end = arr[arr.length - 1];

//   for (let index = start; index < end; index++) {
//     if (arr.indexOf(index) === -1) misses.push(index);
//   }
//   return misses;
// }

function missing(arr) {
  let sequence = [];
  for (let index = arr[0]; index < arr[arr.length - 1]; index += 1) {
    sequence.push(index);
  }
  let misses = [];
  sequence.forEach((val) => {
    if (!arr.includes(val)) misses.push(val);
  });
  return misses;
}

console.log(missing([-3, -2, 1, 5])); // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4])); // []
console.log(missing([1, 5])); // [2, 3, 4]
console.log(missing([6])); // []
