/*
Ascending Consecutive Numbers
Write a function that returns true if a string consists of ascending AND consecutive numbers.

Notes
A number can consist of any number of digits, so long as the numbers are adjacent to each other, and the string has at least two of them.
*/

/*
Input: A number string
Output:  whether there is ascending number in the string
Rules: 
  A number can consist of any number of digits, so long as the numbers are adjacent to each other, and the string has at least two of them.
  
Examples:
  "232425"
  ["2', "3", "2", "4", "2", "5"]
  ["23", "24", "25"]

  "2324256"
  ["2', "3", "2", "4", "2", "5", "6"]
  ["23", "24", "25", "6"]
  []

  "444445"
  ["4", "4", "4", "4", "4", "5"]
  ["44", "44", "45"]
  ["444", "445"]
  

Data Structure:
  

Algorithms:
  have a number that starts at 1, indicating the length of characters to split the string by
  
  iterate the from length 1 to half of the length of the original string (round down (length / 2))
    Get the possible combination of numbers from the current length
    Iterate through the combo array from beginning to end - 1
      check if the next element's value is 1 greater than the current element's value
        if not, return false
    return true if all numbers are ascending consecutive
  return false

  
  - Get possible combination of numbers with a given length from the number string
    Create an array that stores the combinations
    Iterate index from 0, to (length - nubmer of chars), increment by (number of chars)
      get the substring of numbers, start at the current index, and with lenght (number of chars)
      convert the substring to number, push the number to the combo array
    return the combo array

  0 3 6
  0 1 2 3 4 5 6 
   "123456"
   [12, 34, 56]


*/

function ascending(stringNumber) {
  for (let numberLength = 1; numberLength <= Math.floor(stringNumber.length / 2); numberLength += 1) {
    let numbers = extractNumbers(stringNumber, numberLength);
    if (allAscendingNumbers(numbers)) return true;
  }

  return false;
}

function allAscendingNumbers(numbers) {
  for (let index = 0; index < numbers.length - 1; index += 1) {
    if (numbers[index] !== numbers[index + 1] - 1) return false;
  }
  return true;
}

function extractNumbers(stringNumber, numberLength) {
  let numbers = [];

  for (let index = 0; index < stringNumber.length; index += numberLength) {
    let numberStr;
    if (numberLength === 1) {
      if (index != 0 && stringNumber.substr(index, 2) === '10') {
        numberStr = '10';
        index += 1;
      } else {
        numberStr = stringNumber[index];
      }
    } else {
      numberStr = stringNumber.substr(index, numberLength);
    }
    numbers.push(Number(numberStr));
  }
  return numbers;
}

// console.log(ascending('232425')); // true
// // Consecutive numbers 23, 24, 25

// console.log(ascending('2324256')); // false
// // No matter how this string is divided, the numbers are not consecutive.

// console.log(ascending('444445')); // true
// // Consecutive numbers 444 and 445.

// go up from 9 to 10
console.log(ascending('78910')); // true
console.log(ascending('1023456789')); // false

// // trues
// console.log(ascending('123412351236'));
// console.log(ascending('57585960616263'));
// console.log(ascending('500001500002500003'));
// console.log(ascending('919920921'));

// // falses
// console.log(ascending('2324256'));
// console.log(ascending('1235'));
// console.log(ascending('121316'));
// console.log(ascending('12131213'));
// console.log(ascending('54321'));
// console.log(ascending('56555453'));
// console.log(ascending('90090190290'));
// console.log(ascending('35236237238'));
