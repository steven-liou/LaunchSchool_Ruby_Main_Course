/*
Input: a string, and a searchString to check if the former string starts with the searchSTring
Output: boolean value whether the string starts with the searchString 
Rules: 
  

Data Structure:
  a temp string that holds the current substring 

Algorithms:
  iterate through the searchString
    if the current character of the searchString does not equal to the string, then return false
  return true after all the characters of the search string has been checked

*/

function startsWith(string, searchString) {
  for (let index = 0; index < searchString.length; index++) {
    if (searchString[index] !== string[index]) return false;
   
  }

  return true;
}

let str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We')); // true
console.log(startsWith(str, 'We put')); // true
console.log(startsWith(str, '')); // true
console.log(startsWith(str, 'put')); // false

let longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString)); // false
