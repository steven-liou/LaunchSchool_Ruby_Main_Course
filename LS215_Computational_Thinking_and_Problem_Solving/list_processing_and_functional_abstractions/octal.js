function octalToDecimal(numberString) {
  let decimals = numberString.split('').map((digitChar, index) => {
    return parseInt(digitChar, 10) * Math.pow(8, numberString.length - 1 - index);
  });

  return decimals.reduce((sum, number) => sum + number, 0);
}

console.log(octalToDecimal('1')); // 1
console.log(octalToDecimal('10')); // 8
console.log(octalToDecimal('130')); // 88
console.log(octalToDecimal('17')); // 15
console.log(octalToDecimal('2047')); // 1063
console.log(octalToDecimal('011')); // 9
