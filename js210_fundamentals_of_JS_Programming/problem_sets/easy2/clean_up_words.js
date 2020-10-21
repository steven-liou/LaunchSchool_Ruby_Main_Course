/* Algorithm
Store the result in a string
Iterate through the string by char
  if the current string is not a letter,
    if the next letter also is not a letter, continue
    else store a space into the string
  else stor the letter to the string
return string
    
*/

const ALPHABETS = 'abcdefghijklmnopqrstuvwxyz';

// function cleanUp(string) {
//   let result = '';

//   for (let index = 0; index < string.length; index++) {
//     let chr = string[index];
//     if (isAlphabet(chr)) {
//       result += chr;
//     } else {
//       if (result[result.length - 1] !== ' ') result += ' ';
//     }
//   }
//   return result;
// }

// function isAlphabet(chr) {
//   return 'a' <= chr.toLowerCase() && chr.toLowerCase() <= 'z';
// }

function cleanUp(text) {
  return text.replace(/[^a-z]+/gi, ' ');
}

console.log(cleanUp("---what's my +*& line?")); // " what s my line "
