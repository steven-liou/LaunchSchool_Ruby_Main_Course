function isAllUnique(string) {
  let seen = {};
  let lowerCasedString = string.toLowerCase();

  for (let index = 0; index < lowerCasedString.length; index += 1) {
    let char = lowerCasedString[index];
    if (char === ' ') continue;
    if (seen[char]) return false;
    seen[char] = 1;
  }
  return true;
}

console.log(isAllUnique('The quick brown fox jumped over a lazy dog')); // false
console.log(isAllUnique('123,456,789')); // false
console.log(isAllUnique('The big apple')); // false
console.log(isAllUnique('The big apPlE')); // false
console.log(isAllUnique('!@#$%^&*()')); // true
console.log(isAllUnique('abcdefghijklmnopqrstuvwxyz')); // true
