/*
Input: a string and a number that represents the number of times the string should be repeated
Output: the repeated string 
Rules: 
  if the number is -1 or non-integer,  returnd undefined
  if the number is 0, return empty string 

Data Structure:
  a string that holds the modified string values
  

Algorithms:
  first check if the input number is valid 
  Iterate N number of times
    each time append the input string to the modified string
  return the modified string

*/

const isCount = (value) => Number.isInteger(value) && value >= 0;

function repeat(string, times) {
  if (!isCount(times)) return undefined;

  let repeatString = "";

  for (let index = 0; index < times; index++) {
    repeatString += string;
  }

  return repeatString;
}

console.log(repeat("abc", 1)); // "abc"
console.log(repeat("abc", 2)); // "abcabc"
console.log(repeat("abc", -1)); // undefined
console.log(repeat("abc", 0)); // ""
console.log(repeat("abc", "a")); // undefined
console.log(repeat("abc", false)); // undefined
console.log(repeat("abc", null)); // undefined
console.log(repeat("abc", "  ")); // undefined
