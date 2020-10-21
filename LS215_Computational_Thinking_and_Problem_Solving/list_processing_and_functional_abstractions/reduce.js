function myReduce(array, func, initial) {
  let index;
  let accumulator;

  if (initial == undefined) {
    index = 1;
    accumulator = array[0];
  } else {
    index = 0;
    accumulator = initial;
  }

  array.slice(index).forEach((value, index, array) => (accumulator = func(accumulator, value, index, array)));

  return accumulator;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest)); // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10)); // 49
