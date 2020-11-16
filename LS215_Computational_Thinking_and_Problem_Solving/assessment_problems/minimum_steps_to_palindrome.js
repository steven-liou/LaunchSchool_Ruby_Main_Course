/*
Given an incomplete palindrome as a string, return the minimum letters needed to be added on to the end to make the string a palindrome.

Notes
Trivially, words which are already palindromes should return 0.
*/

/*
Input: a string
Output: minimum number of character needed to make the string a palindrome 
Rules: 
  
Examples:
  "race" === "ecar" ?
  "ace" === "eca" ?
  "ce" === "ec" ?
  "e" === "e" ? 
  

Data Structure:
  

Algorithms:
  have a number that keeps track of how many chars to add to the string to make it a palindrome

  iterate by index from index 0 to the length of the string
  Check if the substring from current index to the end of the string is the same forward and reverse
    if it is, return the current count
    else, increment the current count
  return current count
*/

function minPalindromeSteps(string) {
  let count = 0;

  for (let index = 0; index < string.length; index += 1) {
    if (string.slice(index) === string.slice(index).split('').reverse().join('')) {
      return count;
    } else {
      count += 1;
    }
  }
  return count;
}

console.log(minPalindromeSteps('race')); // 3
// Add 3 letters: "car" to make "racecar"

console.log(minPalindromeSteps('mada')); // 1
// Add 1 letter: "m" to make "madam"

console.log(minPalindromeSteps('mirror')); // 3
// Add 3 letters: "rim" to make "mirrorrim"
