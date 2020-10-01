/*
Input: a string, a start, and an end inex 
Output: the substring specified by the start and end index 
Rules: 
  if both start and end index are positive, and start is smaller than end, extract the string from start to the end index (exclusive)
                                                start is greater than end, swap the two values and continue as above
  if start === end, return an empty string
  if no end index, return the substring from start index to the end of string
  if either start or end is less than 0 or NaN, treat it as 0
  if either start or end is greater than the length of the string, treat it as equal to the string length

Data Structure:
  a temporary string for storing the substring 

Algorithms:
  check if end index is ommitted, if it is, set it to string length 
  check if start or end index is less than 0 or NaN, set them to 0
  check if start or end is greater than the length of the string, set them to the string length
  check if start and end indices are the same, if so, return an empty string
  
  iterate through the string from start index
    add the current character to the substring
  return the substring

*/

function substring(string, start, end) {
  if (end === undefined) end = string.length;
  if (start < 0 || isNaN(start)) start = 0;
  if (end < 0 || isNaN(end)) end = 0;
  if (start === end) return "";
  if (start > end) [start, end] = [end, start];

  let substring = "";

  for (let index = start; index < end; index++) {
    if (index > string.length - 1) break;
    substring += string[index];
  }

  return substring;
}

let string = "hello world";

console.log(`"${substring(string, 2, 4)}"`); // "ll"
console.log(`"${substring(string, 4, 2)}"`); // "ll"
console.log(`"${substring(string, 0, -1)}"`); // ""
console.log(`"${substring(string, 2)}"`); // "llo world"
console.log(`"${substring(string, "a")}"`); // "hello world"
console.log(`"${substring(string, 8, 20)}"`); // "rld"
