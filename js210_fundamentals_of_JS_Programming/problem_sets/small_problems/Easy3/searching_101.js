// let readLineSync = require('readline-sync');
// let numbers = [];
// let searchNumber;

// numbers.push(readLineSync.question('Enter the 1st number: '));
// numbers.push(readLineSync.question('Enter the 2nd number: '));
// numbers.push(readLineSync.question('Enter the 3rd number: '));
// numbers.push(readLineSync.question('Enter the 4th number: '));
// numbers.push(readLineSync.question('Enter the 5th number: '));
// searchNumber = readLineSync.question('Enter the last number: ');

// if (numbers.includes(searchNumber)) {
//   console.log(`The number ${searchNumber} appears in [${numbers.join(', ')}].`);
// } else {
//   console.log(`The number ${searchNumber} does not appears in [${numbers.join(', ')}].`);
// }

// check if a number in an array satisfy a condition, say greater than 25

if ([1, 2, 3, 46].some((num) => num > 25)) {
  console.log('There is an element that is greater than 25 in this array');
}
