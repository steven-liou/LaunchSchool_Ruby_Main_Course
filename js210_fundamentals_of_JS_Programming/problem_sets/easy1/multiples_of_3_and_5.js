function multisum(maxValue) {
  let sum = 0;

  const isMultiple = (number, divisor) => number % divisor === 0;
  for (let index = 1; index <= maxValue; index++) {
    if (isMultiple(index, 3) || isMultiple(index, 5)) {
      sum = sum + index;
    }
  }
  return sum;
}

console.log(multisum(3)); // 3
console.log(multisum(5)); // 8
console.log(multisum(10)); // 33
console.log(multisum(1000)); // 234168
