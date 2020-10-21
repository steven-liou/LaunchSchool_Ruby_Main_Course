function rotateRightmostDigits(number, rotateDigit) {
  let digits = String(number);
  let rotatedDigits = digits.slice(0, -rotateDigit).concat(rotateString(digits.slice(-rotateDigit)));
  return parseInt(rotatedDigits);
}

function rotateString(string) {
  return string.slice(1) + string[0];
}

console.log(rotateRightmostDigits(735291, 1)); // 735291
console.log(rotateRightmostDigits(735291, 2)); // 735219
console.log(rotateRightmostDigits(735291, 3)); // 735912
console.log(rotateRightmostDigits(735291, 4)); // 732915
console.log(rotateRightmostDigits(735291, 5)); // 752913
console.log(rotateRightmostDigits(735291, 6)); // 352917

// let digits = String(number).split('');
// index = digits.length - rotateDigit;
// let rotatedDigits = digits.slice(0, index).concat(digits.slice(index + 1), digits[index]);
// return parseInt(rotatedDigits.join(''), 10);
