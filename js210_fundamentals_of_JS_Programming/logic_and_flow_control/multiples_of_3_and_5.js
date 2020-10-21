function multiplesOfThreeAndFive(startNumber, upToNumber) {
  for (let index = startNumber; index <= upToNumber; index++) {
    if (index % 3 == 0 && index % 5 == 0) {
      console.log(String(index) + '!');
    } else if (index % 3 == 0 || index % 5 == 0) {
      console.log(String(index));
    }
  }
}

multiplesOfThreeAndFive(1, 100);
