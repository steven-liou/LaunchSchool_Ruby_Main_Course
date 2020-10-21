function repeatedCharacters(string) {
  string = string.toLowerCase();
  let counts = {};
  for (let index = 0; index < string.length; index++) {
    let currentChar = string[index];
    counts[currentChar] = (counts[currentChar] || 0) + 1;
  }
  for (chr in counts) {
    if (counts[chr] < 2) delete counts[chr];
  }
  return counts;
}

console.log(repeatedCharacters('Programming')); // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination')); // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet')); // {}
console.log(repeatedCharacters('Paper')); // { p: 2 }
console.log(repeatedCharacters('Baseless')); // { s: 3, e: 2 }
