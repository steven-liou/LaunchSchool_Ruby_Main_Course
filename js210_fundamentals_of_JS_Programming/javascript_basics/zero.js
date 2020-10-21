function isNegativeZero(number) {
  return 1 / number === -Infinity;
}

console.log(isNegativeZero(-0));
console.log(isNegativeZero(0));
console.log(isNegativeZero(-10));
console.log(isNegativeZero(10));
