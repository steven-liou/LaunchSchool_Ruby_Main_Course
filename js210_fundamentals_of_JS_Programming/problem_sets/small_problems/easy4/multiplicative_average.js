function showMultiplicativeAverage(array) {
  let result = array.reduce((product, value) => product * value) / array.length;
  return result.toFixed(3);
}
console.log(showMultiplicativeAverage([3, 5]));                   // "7.500"
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));    // "28361.667"
