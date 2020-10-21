function wordSizes(string) {
  if (!string) return {};

  return string.split(' ').reduce((hash, word) => {
    let length = word.length;
    hash[length] = (hash[length] || 0) + 1;
    return hash;
  }, {});
}

console.log(wordSizes('Four score and seven.')); // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!')); // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?")); // { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes('')); // {}
