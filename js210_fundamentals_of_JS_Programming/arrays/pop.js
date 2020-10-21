let pop = (arr) => {
  if (arr.length === 0) return undefined;
  let newLength = arr.length - 1;
  let popValue = arr[newLength];
  arr.length = newLength;
  return popValue;
};

let count = [1, 2, 3];
console.log(pop(count)); // 3
console.log(count); // [ 1, 2 ]
