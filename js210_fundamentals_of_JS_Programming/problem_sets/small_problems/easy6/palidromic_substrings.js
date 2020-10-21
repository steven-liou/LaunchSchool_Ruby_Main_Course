function palindromes(string) {
  return substrings(string).filter((substring) => {
    return (substring === substring.split('').reverse().join('') && substring.length > 1);
  });
}

function substrings(string) {
  return string.split('').reduce((substrings, _, startIndex) => {
    let substring = string.slice(startIndex);
    return substrings.concat(leadingSubstrings(substring))
  }, [])
}

function leadingSubstrings(string) {
  return string.split('').map((_, index) => string.slice(0, index + 1));
}
console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
["ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo"]

console.log(palindromes('knitting cassettes'));
// returns
["nittin", "itti", "tt", "ss", "settes", "ette", "tt"]
