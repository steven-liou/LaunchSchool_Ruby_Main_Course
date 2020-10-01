/*
Input: a string 
Output: ciphered string by rot13 
Rules: 
  if a character is a letter, transform the letter so that it is 13 alphabetes later than the current letter
  if the transformation reaches the end of the alphabet, then wrap it to the beginning

Data Structure:
  a temporary string for storing ciphered characters
  

Algorithms:
  Iterate through the string char by char
    if the current character is an alphabet 
      check if the current character is uppercase or lowercase
      if the current character is uppercase, subtract it by the ASCII number for "A"
      if the current character is uppercase, subtract it by the ASCII number for "a"
      add 13 to the number and take the remainder of the number by 26
      convert back to letter by adding the ASCII value used for the respective letter case
      and add the ciphered letter to temp string
    else
       concatenate the current char to the temp string
  return the temp string

  

*/

function rot13(string) {
  let cipheredString = '';

  for (let index = 0; index < string.length; index++) {
    let chr = string[index];
    chrIndex = chr.toLowerCase().charCodeAt();

    if ('a'.charCodeAt() <= chrIndex && chrIndex <= 'z'.charCodeAt()) {
      let caseIndex = chr.charCodeAt() < 'a'.charCodeAt() ? 'A' : 'a';

      alphabeticIndex = chr.charCodeAt() - caseIndex.charCodeAt();
      rotIndex = ((alphabeticIndex + 13) % 26) + caseIndex.charCodeAt();
      cipheredString += String.fromCharCode(rotIndex);
    } else {
      cipheredString += chr;
    }
  }
  return cipheredString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
