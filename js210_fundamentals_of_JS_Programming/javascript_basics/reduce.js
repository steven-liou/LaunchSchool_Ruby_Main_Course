function sumOfSquares(array) {
  return array.reduce(function (sum, val) {
    return sum + val * val;
  }, 0);
}
let numbers = [3, 5, 7];
console.log(sumOfSquares(numbers)); // => 83
