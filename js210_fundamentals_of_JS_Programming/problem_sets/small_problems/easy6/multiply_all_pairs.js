function multiplyAllPairs(array1, array2) {
  let products = [];

  array1.forEach(number1 => {
    array2.forEach(number2 => products.push(number1 * number2));
  })
  return products.sort((num1, num2) => num1 - num2);
}
console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]
