/*
Input: a string containing consecutive letter repeats;
Output: a new string without any consecutive letter repeat 
Rules: 
  

Data Structure:
  a string for storing final result 

Algorithms:
  iterate through the string char by char
    store the current character if it is not the same as the next character in the string
  return the result string

*/

function crunch(string) {
  let result = '';

  for (let index = 0; index < string.length; index++) {
    let currentChr = string[index];
    if (currentChr !== string[index + 1]) {
      result += currentChr;
    }
  }
  return result;
}

console.log(crunch('ddaaiillyy ddoouubbllee')); // "daily double"
console.log(crunch('4444abcabccba')); // "4abcabcba"
console.log(crunch('ggggggggggggggg')); // "g"
console.log(crunch('a')); // "a"
console.log(crunch('')); // ""
