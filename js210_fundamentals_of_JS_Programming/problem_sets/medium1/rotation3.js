function maxRotation(number) {
  let length = String(number).length;

  for (let index = length; index > 1; index -= 1) {
    number = rotateRightmostDigits(number, index);
  }
  return number;
}

function rotateRightmostDigits(number, rotateDigit) {
  let digits = String(number);
  let rotatedDigits = digits.slice(0, -rotateDigit).concat(rotateString(digits.slice(-rotateDigit)));
  return parseInt(rotatedDigits);
}

function rotateString(string) {
  return string.slice(1) + string[0];
}

console.log(maxRotation(735291)); // 321579
console.log(maxRotation(3)); // 3
console.log(maxRotation(35)); // 53
console.log(maxRotation(105)); // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146)); // 7321609845
