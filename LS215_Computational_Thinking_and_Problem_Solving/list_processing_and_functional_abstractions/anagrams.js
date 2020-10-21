function anagram(word, list) {
  return list.filter((listWord) => areAnagrams(word, listWord));
}

function areAnagrams(sourceWord, targetWord) {
  if (sourceWord.length !== targetWord.length) return false;
  let sourceLetters = sourceWord.split('').sort();
  let targetLetters = targetWord.split('').sort();
  return compareArrays(sourceLetters, targetLetters);
}

function compareArrays(array1, array2) {
  return array1.every((element, index) => element === array2[index]);
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana'])); // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana'])); // [ "enlist", "inlets" ]
