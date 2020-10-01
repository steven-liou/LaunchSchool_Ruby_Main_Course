/*
Input: string with leading or trailing white spaces
Output: normalized string without leading or trailing spaces
Rules: 
  Do not remove internal white spaces of the string 

Data Structure:
  A string that holds modified string 
  A value that indicates if a non-space character has been reached

Algorithms:
  Trim leading spaces
    Iterate from the beginning of the string to the first non white character
    if the current character is not a space, set the boolean value to false, add the current character to string
    if the current character is a space, do not append it to the modified string if the boolean value is true

  Trime trailing spaces of the modified string
    Iterate from the end of the string to the first non white character


*/

function trim(string) {
  let trimmedString = trim_leading_spaces(string);
  trimmedString = trim_trailing_spaces(trimmedString);

  return trimmedString;
}

function trim_leading_spaces(string) {
  let isLeadingSpace = true;
  let trimmedString = "";
  let currentChar;
  for (let index = 0; index < string.length; index++) {
    currentChar = string[index];
    if (currentChar == " " && isLeadingSpace) continue;
    trimmedString += currentChar;
    isLeadingSpace = false;
  }

  return trimmedString;
}

function trim_trailing_spaces(string) {
  let isTralingSpace = true;
  let trimmedString = "";
  let currentChar;
  for (let index = string.length - 1; index >= 0; index--) {
    currentChar = string[index];
    if (currentChar == " " && isTralingSpace) continue;
    trimmedString = currentChar + trimmedString;
    isTralingSpace = false;
  }

  return trimmedString;
}

console.log(`"${trim("  abc  ")}"`);
console.log(`"${trim("abc  ")}"`);
console.log(`"${trim(" ab c  ")}"`);
console.log(`"${trim(" a b c")}"`);
console.log(`"${trim("    ")}"`);
console.log(`"${trim("")}"`);
