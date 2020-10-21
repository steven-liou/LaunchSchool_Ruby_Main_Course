let x = 1;
function average(array) {
  return sum(array) / array.length;
}

function sum(array) {
  let total = 0;
  for (let index = 0; index < array.length; index++) {
    total += array[index];
  }
  return total;
}

console.log(sum([1, 2, 3, 4, 5]));
console.log(average([1, 2, 3, 4, 5]));
