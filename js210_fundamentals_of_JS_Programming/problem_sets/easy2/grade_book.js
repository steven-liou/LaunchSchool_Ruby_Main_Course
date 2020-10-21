function getGrade(...grades) {
  let averageGrade = average(grades);
  let letterGrade;

  if (90 <= averageGrade) {
    letterGrade = 'A';
  } else if (80 <= averageGrade) {
    letterGrade = 'B';
  } else if (70 <= averageGrade) {
    letterGrade = 'C';
  } else if (60 <= averageGrade) {
    letterGrade = 'D';
  } else {
    letterGrade = 'F';
  }
  return letterGrade;
}

function average(numbers) {
  let sum = 0;
  for (let index = 0; index < numbers.length; index++) {
    sum += numbers[index];
  }

  return sum / numbers.length;
}

console.log(getGrade(95, 90, 93)); // "A"
console.log(getGrade(50, 50, 95)); // "D"
