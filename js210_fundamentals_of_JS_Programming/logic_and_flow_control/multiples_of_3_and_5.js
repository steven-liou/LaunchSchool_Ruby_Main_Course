function multiplesOfThreeAndFive(startNumber, upToNumber) {
  for (let currentNumber = startNumber; currentNumber <= upToNumber; currentNumber++) {
    if (currentNumber % 3 == 0 && currentNumber % 5 == 0) {
      console.log(String(currentNumber) + "!");
    } else if (currentNumber % 3 == 0 || currentNumber % 5 == 0) {
      console.log(String(currentNumber));
    }
  }
}

multiplesOfThreeAndFive(90, 100);
