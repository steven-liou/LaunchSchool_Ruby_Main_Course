/*
Input: a string to be split by the second delimiter string 
Output: output the splitted substrings 
Rules: 
  if the delimiter is empty, each character is split 
  if no delimiter is specified, the string is not split

Data Structure:
 a start specifying where the substring starts
  

Algorithms:
  Iterate through the string char by char
    if the current character is the delimiter, output the substring 
      update the start index to the next index
      
      
  

*/

function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log("Error: No delimiter");
    return;
  }

  const lastIndex = string.length - 1;
  let substring = "";
  let currentChar;
  for (let index = 0; index <= lastIndex; index++) {
    currentChar = string[index];
    if (currentChar === delimiter) {
      console.log(substring);
      substring = "";
    } else if (delimiter === "") {
      console.log(currentChar);
    } else {
      substring += currentChar;
    }
  }
  if (substring) console.log(substring);
}

splitString("abc,123,hello world", ",");
splitString("hello");
splitString("hello", "");
splitString("hello", ";");
// logs:
// hello

splitString(";hello;", ";");
