function interleave(...args) {
  let zippedArray = [];
  let maxLength = args.map(arr => arr.length).sort().slice(-1);

  for (let outerI = 0; outerI < maxLength; outerI += 1) {
    args.forEach(arr => {
      if (arr[outerI]) zippedArray.push(arr[outerI]);
    });
  }
  return zippedArray;
}

console.log(interleave([1, 2, 3], ['a', 'b', 'c'], [5, 6, 7]));    // [1, "a", 2, "b", 3, "c"]
