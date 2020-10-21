function multiplyList(array1, array2) {
  let result = [];

  for (let index = 0; index < array1.length; index += 1) {
    result[index] = array1[index] * array2[index];
  }
  return result;
}

console.log(multiplyList([3, 5, 7], [9, 10, 11]));    // [27, 50, 77]
