function concat(...args) {
  let concatArray = [];

  for (let index = 0; index < args.length; index++) {
    let ele = args[index];
    if (Array.isArray(ele)) {
      for (let index = 0; index < ele.length; index++) {
        concatArray.push(ele[index]);
      }
    } else {
      concatArray.push(ele);
    }
  }
  return concatArray;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9])); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two'])); // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4)); // [1, 2, "three", 4]
