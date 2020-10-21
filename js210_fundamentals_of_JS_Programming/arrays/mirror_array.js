function mirrorArray(arr) {
  let result = [];
  let lastIndex = arr.length * 2 - 1;

  for (let index = 0; index < arr.length; index++) {
    value = arr[index];
    result[index] = value;
    result[lastIndex - index] = value;
  }

  return result;
}

let digits = [1, 2, 3, 4, 5, 6];
console.log(mirrorArray(digits));
