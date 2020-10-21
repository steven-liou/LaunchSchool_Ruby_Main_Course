function myOwnEvery(array, func) {
  for (let index = 0; index < array.length; index += 1) {
    if (!func(array[index], index, array)) return false;
  }
  return true;
}

function areAllNumbers(array) {
  return myOwnEvery(array, isANumber);
}

function isANumber(value) {
  return typeof value === 'number' && !Number.isNaN(value);
}

console.log(areAllNumbers([1, 5, 6, 7, '1'])); // false
console.log(areAllNumbers([1, 5, 6, 7, 1])); // true
console.log(areAllNumbers([1, 5, 6, 7, NaN])); // false
