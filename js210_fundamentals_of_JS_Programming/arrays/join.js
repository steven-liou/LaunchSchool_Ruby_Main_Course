function join(arr, delimeter) {
  let result = '';

  for (let index = 0; index < arr.length; index += 1) {
    result += arr[index];
    if (index !== arr.length - 1) result += delimeter;
  }
  return result;
}

console.log(join(['bri', 'tru', 'wha'], 'ck ')); // 'brick truck wha'
console.log(join([1, 2, 3], ' and ')); // '1 and 2 and 3'
