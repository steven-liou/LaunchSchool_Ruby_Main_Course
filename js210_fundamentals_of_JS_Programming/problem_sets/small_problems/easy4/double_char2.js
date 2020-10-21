const VOWELS = 'aeiou';

function doubleConsonants(string) {
  return string.split('').reduce((doubleCons, char) => {
    doubleCons += char;
    if (isConsonants(char)) doubleCons += char;
    return doubleCons;
  }, '');
}

function isConsonants(char) {
  char = char.toLowerCase();
  return ('a' < char && char < 'z' && VOWELS.indexOf(char) === -1);
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""
