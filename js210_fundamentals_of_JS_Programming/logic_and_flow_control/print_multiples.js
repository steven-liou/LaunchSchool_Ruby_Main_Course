function logMultiples(factor) {
  let multiples = Math.floor(100 / factor);
  let startiingNumber = factor * multiples;

  for (let index = startiingNumber; index > 0; index -= factor) {
    if (index % 2 !== 0) console.log(index);
  }
}

logMultiples(17);
logMultiples(21);
