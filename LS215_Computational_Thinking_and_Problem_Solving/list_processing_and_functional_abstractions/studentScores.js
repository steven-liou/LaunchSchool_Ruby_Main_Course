let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function generateClassRecordSummary(studentList) {
  let record = {
    studentGrades: getStudentScores(studentList),
    exams: getExamStats(studentList),
  };

  return record;
}

function getStudentScores(studentList) {
  return Object.keys(studentList).reduce((finalGrades, student) => {
    let percentGrade = semesterPercentGrade(studentList[student].scores);
    let letterGrade = percentGrandeToLetterGrade(percentGrade);
    finalGrades.push(`${percentGrade} (${letterGrade})`);
    return finalGrades;
  }, []);
}

function getExamStats(studentList) {
  let scoresInEachExam = Object.keys(studentList).reduce((examList, student) => {
    studentList[student].scores.exams.forEach((score, index) => {
      examList[index] = examList[index] || [];
      examList[index].push(score);
    });
    return examList;
  }, []);

  return scoresInEachExam.map((exam) => {
    return {
      average: total(exam) / exam.length,
      minimum: Math.min(...exam),
      maximum: Math.max(...exam),
    };
  });
}

function percentGrandeToLetterGrade(percent) {
  if (93 <= percent && percent << 100) {
    return 'A';
  } else if (85 <= percent) {
    return 'B';
  } else if (77 <= percent) {
    return 'C';
  } else if (69 <= percent) {
    return 'D';
  } else if (60 <= percent) {
    return 'E';
  } else {
    return 'F';
  }
}

function semesterPercentGrade(scores) {
  let examTotalScore = total(scores.exams) / scores.exams.length;
  let exerciseTotalScore = total(scores.exercises);
  return Math.round(examTotalScore * 0.65 + exerciseTotalScore * 0.35);
}

function total(array) {
  return array.reduce((total, number) => total + number);
}

console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }
