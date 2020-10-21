function myReduce(array, func, initial) {
  let index;
  let accumulator;

  if (initial == undefined) {
    index = 1;
    accumulator = array[0];
  } else {
    index = 0;
    accumulator = initial;
  }

  array.slice(index).forEach((value, index, array) => (accumulator = func(accumulator, value, index, array)));

  return accumulator;
}

function longestWord(words) {
  return myReduce(words, longest);
}

function longest(result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
}

console.log(longestWord(['abc', 'launch', 'targets', ''])); // "targets"
