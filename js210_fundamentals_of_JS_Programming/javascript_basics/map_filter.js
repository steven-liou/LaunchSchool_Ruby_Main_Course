function oddLengths(array) {
  let filteredNumbersArray = array.map(function (letters) {
    return letters.length
  }).filter(function (number) {return number % 2 !== 0});
  return filteredNumbersArray;
}
let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr)); // => [1, 5, 3]

