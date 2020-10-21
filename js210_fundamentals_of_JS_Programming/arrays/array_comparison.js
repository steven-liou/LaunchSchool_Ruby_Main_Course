function areArraysEqual(array1, array2) {
  if (array1.length !== array2.length) return false;

  let copyArray2 = array2.slice();
  for (let index = 0; index < array1.length; index++) {
    let matchIndex = copyArray2.indexOf(array1[index]);
    if (matchIndex !== -1) {
      copyArray2.splice(matchIndex, 1);
    } else {
      return false;
    }
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3])); // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1])); // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a'])); // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3])); // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1])); // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3])); // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1])); // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2])); // false
console.log(areArraysEqual([1, 1, 1], [1, 1])); // false
console.log(areArraysEqual([1, 1], [1, 1])); // true
