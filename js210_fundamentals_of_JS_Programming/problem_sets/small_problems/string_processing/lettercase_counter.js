function letterCaseCount(string) {
  return string.split('').reduce((hash, char) => {
    if (/[a-z]/.test(char)) {
      hash['lowercase'] = hash['lowercase'] + 1;
    } else if (/[A-Z]/.test(char)) {
      hash['uppercase'] = hash['uppercase'] + 1;
    } else {
      hash['neither'] = hash['neither'] + 1;
    }
    return hash;
  }, {lowercase: 0, uppercase: 0, neither: 0, });
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
