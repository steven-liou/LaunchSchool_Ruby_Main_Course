function isPrime(integer) {
  if (integer <= 1 || (integer > 2 && integer % 2 === 0)) return false;

  for (let index = 2; index <= Math.sqrt(integer); index++) {
    if (integer % index === 0) return false;
  }

  return true;
}

console.log(isPrime(1)); // false
console.log(isPrime(2)); // true
console.log(isPrime(3)); // true
console.log(isPrime(43)); // true
console.log(isPrime(55)); // false
console.log(isPrime(0)); // false
