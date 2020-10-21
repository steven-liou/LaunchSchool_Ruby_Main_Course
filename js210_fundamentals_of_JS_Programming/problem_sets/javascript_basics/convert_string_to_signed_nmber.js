const DIGITS = {
  0: 0,
  1: 1,
  2: 2,
  3: 3,
  4: 4,
  5: 5,
  6: 6,
  7: 7,
  8: 8,
  9: 9,
};

function stringToInteger(string) {
  let number = 0;

  for (let index = 0, len = string.length; index < len; index++) {
    let chr = string[index];
    number = number * 10 + DIGITS[chr];
  }
  return number;
}

function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-':
      return -stringToInteger(string.slice(1));
    case '+':
      return stringToInteger(string.slice(1));
    default:
      return stringToInteger(string);
  }
}

console.log(stringToSignedInteger('4321')); // 4321
console.log(stringToSignedInteger('-570')); // -570
console.log(stringToSignedInteger('+100')); // 100
