let names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];

let letterCounts = names
  .map((word) => word[0])
  .reduce((hash, letter) => {
    hash[letter] = (hash[letter] || 0) + 1;
    return hash;
  }, {});

let maxLetter = Object.keys(letterCounts).reduce((maxLetter, letter) => {
  maxLetter = letterCounts[maxLetter] < letterCounts[letter] ? letter : maxLetter;
  return maxLetter;
});

console.log(maxLetter);
