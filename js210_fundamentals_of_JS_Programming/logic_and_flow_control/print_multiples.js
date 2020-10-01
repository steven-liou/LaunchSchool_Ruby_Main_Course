function logMultiples(factor) {
  const largestMultiple = Math.floor(100 / factor);
  const startNumber = largestMultiple * factor;
  for (let currentNumber = startNumber; currentNumber > 0; currentNumber -= factor) {
    if (currentNumber % factor === 0 && currentNumber % 2 !== 0) {
      console.log(currentNumber);
    }
  }
}

logMultiples(17);
logMultiples(21);
