/* input: two strings
   output: number that represents the start index of second string in first string
   Rules: case sensitive match
   AlgorigthM :
    iterate through the first string
      check if the string starting from current index plus the width of the second string - 1 is equal to the second string
      if it is, return the current index
    if no match, return -1


*/

function indexOf(firstString, secondString) {
  let substring;
  const NumberOfChars = secondString.length;

  for (let index = 0, end_index; index < firstString.length - secondString.length + 1; index++) {
    end_index = index + NumberOfChars;
    substring = substring_of(firstString, index, end_index);
    if (secondString === substring) return index;
  }
  return -1;
}

function lastIndexOf(firstString, secondString) {
  let substring;
  const NumberOfChars = secondString.length;
  let end_index;
  for (let index = firstString.length - secondString.length; index >= 0; index--) {
    end_index = index + NumberOfChars;
    substring = substring_of(firstString, index, end_index);
    if (secondString === substring) return index;
  }
  return -1;
}

function substring_of(string, start_index, end_index) {
  let substring = "";
  for (let index = start_index; index < end_index; index += 1) {
    if (index >= string.length) break;
    substring += string[index];
  }
  return substring;
}

console.log(indexOf("Some strings", "s")); // 5
console.log(indexOf("Blue Whale", "Whale")); // 5
console.log(indexOf("Blue Whale", "Blute")); // -1
console.log(indexOf("Blue Whale", "leB")); // -1

console.log(lastIndexOf("Some strings", "s")); // 11
console.log(lastIndexOf("Blue Whale, Killer Whale", "Whale")); // 19
console.log(lastIndexOf("Blue Whale, Killer Whale", "all")); // -1
