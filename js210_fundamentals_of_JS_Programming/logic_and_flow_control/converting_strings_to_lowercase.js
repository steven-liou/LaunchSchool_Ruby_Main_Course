/*
Input: a string 
Output: lowercased string 
Rules: 
   

Data Structure:
  a temp string for the result 
  a dictionary that contains the uppercase character as key and lowercase character as value

Algorithms:
  iterate through the string char by char
  if the current character is in the uppercase letter ASCII range, lower case it by adding 32
  add the current char to the result string

*/

const ALPHABETS = {
  A: "a",
  B: "b",
  C: "c",
  D: "d",
  E: "e",
  F: "f",
  L: "l",
  P: "p",
  T: "t",
};

function toLowerCase(string) {
  let lowercasedString = "";

  for (let index = 0; index < string.length; index++) {
    let currentChar = string[index];
    if (ALPHABETS[currentChar]) {
      lowercasedString += ALPHABETS[currentChar];
    } else {
      lowercasedString += currentChar;
    }
  }
  return lowercasedString;
}

console.log(toLowerCase("ALPHABET")); // "alphabet"
console.log(toLowerCase("123")); // "123"
console.log(toLowerCase("abcDEF"));
