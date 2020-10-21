function swap(sentence) {
  let words = sentence.split(' ');
  let swappedWords = words.map((word) => swapFirstLastCharactesr(word));
  return swappedWords.join(' ');
}

function swapFirstLastCharactesr(word) {
  if (word.length === 1) {
    return word;
  } else {
    return word.slice(-1) + word.slice(1, -1) + word[0];
  }
}

console.log(swap('Oh what a wonderful day it is')); // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde')); // "ebcdA"
console.log(swap('a')); // "a"
