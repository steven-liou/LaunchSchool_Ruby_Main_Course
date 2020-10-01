const readlineSync = require("readline-sync");

const numberOfScores = 5;
const averageScore = getStudentAverageScores(numberOfScores);

let grade = "F";
if (averageScore >= 90) {
  grade = "A";
} else if (averageScore >= 70) {
  grade = "B";
} else if (averageScore >= 50) {
  grade = "C";
}

console.log(`Based on the average of your ${numberOfScores} scores, your letter grade is "${grade}."`);

function getStudentAverageScores(numberOfScores) {
  let TotalScore = 0;
  for (let i = 0; i < numberOfScores; i++) {
    TotalScore += Number(readlineSync.question(`Enter Score ${i + 1}: `));
  }

  return TotalScore / numberOfScores;
}
