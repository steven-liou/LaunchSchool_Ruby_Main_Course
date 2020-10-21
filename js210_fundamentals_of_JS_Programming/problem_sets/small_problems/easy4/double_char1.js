function repeater(string) {
  return string.split('').reduce((doubleString, char) => doubleString + char.repeat(2), '');
}
console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""
