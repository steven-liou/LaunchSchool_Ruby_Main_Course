function generatePattern(nStars) {
  for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
    let string = "";

    for (let digit = 1; digit <= lineNumber; digit += 1) {
      string += String(digit);
    }

    let multiplier;
    for (let count = lineNumber + 1; count <= nStars; count += 1) {
      multiplier = String(count).length;
      string += "*".repeat(multiplier);
    }

    console.log(string);
  }
}

generatePattern(20);
