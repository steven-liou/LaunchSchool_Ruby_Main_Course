function reverse(inputForReversal) {
  let isInputArray = Array.isArray(inputForReversal);
  let result = isInputArray ? [] : '';
  for (let index = inputForReversal.length - 1; index >= 0; index--) {
    let ele = inputForReversal[index];
    if (isInputArray) {
      result.push(ele);
    } else {
      result += ele;
    }
  }
  return result;
}

console.log(reverse('Hello')); // "olleH"
console.log(reverse('a')); // "a"
console.log(reverse([1, 2, 3, 4])); // [4, 3, 2, 1]
console.log(reverse([])); // []

const array = [1, 2, 3];
console.log(reverse(array)); // [3, 2, 1]
console.log(array); // [1, 2, 3]


console.log(reverse());
console.log(reverse());
console.log(reverse());
console.log(reverse());
