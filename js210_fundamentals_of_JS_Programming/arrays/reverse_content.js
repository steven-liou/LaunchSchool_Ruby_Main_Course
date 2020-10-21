function reverseContent(arr) {
  let reverseArr = [];

  for (let index = arr.length - 1; index >= 0; index--) {
    reverseArr.push(arr[index]);
  }

  return reverseArr;
}

console.log(reverseContent([1, 2, 3, 4, 5]));
