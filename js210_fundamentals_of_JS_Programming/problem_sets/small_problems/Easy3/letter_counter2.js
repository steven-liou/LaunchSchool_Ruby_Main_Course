function wordSizes(string) {
  if (!string) return {};

  return string.split(' ').reduce((hash, word) => {
    let length = word.replace(/[^a-z]/gi, '').length;
    hash[length] = (hash[length] || 0) + 1;
    return hash;
  }, {});
}

console.log(wordSizes('Four score and seven.')); // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!')); // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?")); // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes('')); // {}
