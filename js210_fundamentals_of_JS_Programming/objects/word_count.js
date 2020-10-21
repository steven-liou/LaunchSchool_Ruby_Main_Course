function wordCount(string) {
  let stringObj = {};

  let words = string.split(' ');

  for (let index = 0; index < words.length; index++) {
    let currentWord = words[index];
    stringObj[currentWord] = (stringObj[currentWord] || 0) + 1;
  }
  return stringObj;
}

console.log(wordCount('box car cat bag box')); // { box: 2, car: 1, cat: 1, bag: 1 }
