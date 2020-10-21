function shortLongShort(str1, str2) {
  let shortStr;
  let longStr;
   str1.length <= str2.length ? (return [str1, str2]) : (return [str2, str1]);

  return shortStr + longStr + shortStr;
}

console.log(shortLongShort('abc', 'defgh')); // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh')); // "fghabcdefgh"
console.log(shortLongShort('', 'xyz')); // "xyz"
