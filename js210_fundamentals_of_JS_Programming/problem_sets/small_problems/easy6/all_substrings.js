// function substrings(string) {
//   let substrings = [];

//   for (let startIndex = 0; startIndex < string.length; startIndex += 1) {
//     for (let endIndex = startIndex; endIndex < string.length; endIndex += 1) {
//       substrings.push(string.slice(startIndex, endIndex + 1))
//     }
//   }
//   return substrings;
// }
function substrings(string) {
  return string.split('').reduce((substrings, _, startIndex) => {
    let substring = string.slice(startIndex);
    return substrings.concat(leadingSubstrings(substring))
  }, [])
}

function leadingSubstrings(string) {
  return string.split('').map((_, index) => string.slice(0, index + 1));
}

console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]
