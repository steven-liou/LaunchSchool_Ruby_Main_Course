/* Algorithms
create a string that store the result
create a [1, 0] array
iterate from index 0 to n - 1
  check if the current index is odd or even
  add the respective character to the result string
return the string
*/

function stringy(length) {
  let result = '';
  let numbers = ['1', '0'];

  for (let index = 0; index < length; index++) {
    result += numbers[index % 2];
  }
  return result;
}

console.log(stringy(6)); // "101010"
console.log(stringy(9)); // "101010101"
console.log(stringy(4)); // "1010"
console.log(stringy(7)); // "1010101"
