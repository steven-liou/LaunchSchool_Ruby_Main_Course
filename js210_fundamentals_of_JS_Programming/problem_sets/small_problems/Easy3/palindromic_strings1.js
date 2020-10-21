function isPalindrome(string) {
  let middle = Math.floor(string.length / 2);

  for (let index = 0; index < middle; index++) {
    if (string[index] !== string[string.length - 1 - index]) return false;
  }
  return true;
}

console.log(isPalindrome('maam')); // true
console.log(isPalindrome('madam')); // true
console.log(isPalindrome('Madam')); // false (case matters)
console.log(isPalindrome("madam i'm adam")); // false (all characters matter)
console.log(isPalindrome('356653')); // true
