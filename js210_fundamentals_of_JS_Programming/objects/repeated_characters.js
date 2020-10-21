function repeatedCharacters(string) {
  let characters = string
    .toLowerCase()
    .split('')
    .reduce((hash, char) => {
      hash[char] = (hash[char] || 0) + 1;
      return hash;
    }, {});
  for (char in characters) {
    if (characters[char] < 2) {
      delete characters[char];
    }
  }
  return characters;
}

console.log(repeatedCharacters('Programming')); // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination')); // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet')); // {}
console.log(repeatedCharacters('Paper')); // { p: 2 }
console.log(repeatedCharacters('Baseless')); // { s: 3, e: 2 }
