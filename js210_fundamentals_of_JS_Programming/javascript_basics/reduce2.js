function oddLengths(array) {
  return array.reduce(function (oddLengthsArray, val) {
    if (val.length % 2 !== 0) oddLengthsArray.push(val.length);
    return oddLengthsArray;
  }, []);
}
let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr)); // => [1, 5, 3]
