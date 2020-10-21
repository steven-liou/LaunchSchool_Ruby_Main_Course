function findFibonacciIndexByLength(number) {
  if (number < 2) return 1;

  let preVal = 1;
  let curVal = 1;
  let count = 2;

  do {
    [preVal, curVal] = [curVal, preVal + curVal];
    count += 1;
  } while (String(curVal).length < number);
  return count;
}

console.log(findFibonacciIndexByLength(2)); // 7
console.log(findFibonacciIndexByLength(10)); // 45
console.log(findFibonacciIndexByLength(16)); // 74
