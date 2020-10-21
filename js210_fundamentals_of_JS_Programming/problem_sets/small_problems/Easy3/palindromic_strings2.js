function isPalindrome(string) {
  let middle = Math.floor(string.length / 2);

  for (let index = 0; index < middle; index++) {
    if (string[index] !== string[string.length - 1 - index]) return false;
  }
  return true;
}

function isRealPalindrome(string) {
  return isPalindrome(string.toLowerCase().replace(/[^a-z0-9]/g, ''));
}

console.log(isRealPalindrome('madam')); // true
console.log(isRealPalindrome('Madam')); // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam")); // true (only alphanumerics matter)
console.log(isRealPalindrome('356653')); // true
console.log(isRealPalindrome('356a653')); // true
console.log(isRealPalindrome('123ab321')); // false
