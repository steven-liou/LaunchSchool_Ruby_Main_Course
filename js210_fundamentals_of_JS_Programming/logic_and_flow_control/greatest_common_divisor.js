function gcd(number1, number2) {
  let smallerNumber;
  let largerNumber;

  if (number1 >= number2) {
    largerNumber = number1;
    smallerNumber = number2;
  } else {
    smallerNumber = number1;
    largerNumber = number2;
  }

  let largest_common_factors = 1;

  for (let index = smallerNumber; index >= 2; index--) {
    if (smallerNumber % index === 0 && largerNumber % index === 0) {
      largest_common_factors = index;
      break;
    }
  }

  return largest_common_factors;
}

console.log(gcd(12, 4)); // 4
console.log(gcd(15, 10)); // 5
console.log(gcd(9, 2)); // 1
