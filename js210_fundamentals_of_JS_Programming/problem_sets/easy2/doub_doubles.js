function twice(number) {
  if (isDoubleNumber(number)) return number;
  return number * 2;
}

function isDoubleNumber(number) {
  let numStr = String(number);
  if (numStr.length % 2 != 0) return false;

  let middle = numStr.length / 2;

  return numStr.slice(0, middle) === numStr.slice(middle);
}

console.log(twice(37)); // 74
console.log(twice(44)); // 44
console.log(twice(334433)); // 668866
console.log(twice(444)); // 888
console.log(twice(107)); // 214
console.log(twice(103103)); // 103103
console.log(twice(3333)); // 3333
console.log(twice(7676)); // 7676
