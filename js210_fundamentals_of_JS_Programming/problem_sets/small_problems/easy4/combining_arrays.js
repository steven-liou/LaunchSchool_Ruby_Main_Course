function union(...args) {
  function addUnique(sourceArray) {
    sourceArray.forEach((element) => {
      if (!combinedArray.includes(element)) combinedArray.push(element);
    });
  }
  let combinedArray = [];
  args.forEach((array) => addUnique(array));
  return combinedArray;
}

console.log(union([1, 3, 5], [3, 6, 9])); // [1, 3, 5, 6, 9]
