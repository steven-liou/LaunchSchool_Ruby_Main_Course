function staggeredCase(string) {
  let upperCase = true;
  return string
    .split('')
    .map((char) => {
      if (/[a-z]/i.test(char)) {
        if (upperCase) {
          char = char.toUpperCase();
        } else {
          char = char.toLowerCase();
        }
        upperCase = !upperCase;
      }
      return char;
    })
    .join('');
}

console.log(staggeredCase('I Love Launch School!')); // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS')); // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers')); // "IgNoRe 77 ThE 444 nUmBeRs"
