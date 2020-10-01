function isPrime(integer) {
  if (integer <= 1 || (integer > 2 && integer % 2 === 0)) return false;

  for (let index = 2; index <= Math.sqrt(integer); index++) {
    if (integer % index === 0) return false;
  }

  return true;
}

function checkGoldbach(expectedSum) {
  if (expectedSum % 2 != 0 || expectedSum < 4) {
    console.log(null);
    return;
  }

  let other_factor = 1;
  for (let factor = 2; factor <= expectedSum / 2; factor += 1) {
    other_factor = expectedSum - factor;
    if (isPrime(factor) && isPrime(other_factor)) console.log(factor + " " + other_factor);
  }
}

checkGoldbach(3);
checkGoldbach(4);
checkGoldbach(12);
checkGoldbach(100);
