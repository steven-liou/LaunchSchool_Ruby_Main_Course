function digits(number) {
  let digits = [];

  while (number > 0) {
    let last_digit = number % 10;
    digits.unshift(last_digit);
    number -= last_digit;
    number /= 10;
  }
  return digits;
}

console.log(digits(1234));
