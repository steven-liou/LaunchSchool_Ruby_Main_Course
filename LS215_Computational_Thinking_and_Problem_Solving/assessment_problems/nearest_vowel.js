/*
Write a function that takes in a string and for each character, returns the distance to the nearest vowel in the string. If the character is a vowel itself, return `0`.
- Vowels are: `a, e, i, o, u`.
*/

/*
Input: a string
Output: an array of distances from the nearest vowel
Rules:
  vowels are a, e, i, o, u
  If no vowels is found, return NaN for that element
  Case insensitive
Test cases:
  'babab'
  ['b', 'a', 'b', 'a', 'b']
  Indicies of the vowels
    [1, 3]
  Compare the mimnimum distance between the indicies of the vowels and the indices of the array element
  [0, 1, 2, 3, 4]
  [[1, 3], [0, 2], [1, 1], ]2, 0], [3, 1]], possible distances for each element, if no
  [1, 0, 1, 0, 1]    minimum distance for each element

 
  Edge case
    if no indices of vowels are found
      []
      [] if the distances array is empty, return NaN, instead of finding the minimum distance
  
Data Structure
  arrays for the indices of the vowels in the string
  arrays for the minimum distance to the vowels

Algorithm:
  Find the indicies of the vowels in the given string, regardless of letter case
    Split the input string by char, 
    transform the char into indicies if the character is a vowel
    Filter the array of char or vowel index by checking if the element is a number

  Get array of possible vowel indicies
    Iterate through the given string by index (map)
      iterate through each vowel by value (map)
        Find the absolute difference between the vowel index and the current char index

  Transform the possible vowel distances array to the minimum distance array
    Iterate through the possible distances array (map)
      if the current element is an empty array, return NaN
      else, find the minimum value in the array element
  
  Return the minimum distance array
*/

function distanceToNearestVowel(string) {
  let vowelIndicies = findVowelIndicies(string);

  let possibleDistances = string.split('').map((_, index) => {
    return vowelIndicies.map((vowelIndex) => Math.abs(vowelIndex - index));
  });

  return possibleDistances.map((distances) => {
    if (distances.length === 0) {
      return NaN;
    } else {
      return Math.min(...distances);
    }
  });
}

function findVowelIndicies(string) {
  let charsAndVowelIndicies = string.split('').map((char, index) => {
    if (/[aeiou]/i.test(char)) {
      return index;
    } else {
      return char;
    }
  });

  return charsAndVowelIndicies.filter((value) => typeof value === 'number');
}

console.log(distanceToNearestVowel('aaaaa')); //  [0, 0, 0, 0, 0];

console.log(distanceToNearestVowel('babbb')); // [1, 0, 1, 2, 3];

console.log(distanceToNearestVowel('abcdabcd')); // [0, 1, 2, 1, 0, 1, 2, 3];

console.log(distanceToNearestVowel('shopper')); // [2, 1, 0, 1, 1, 0, 1];

// uppercase letters
console.log(distanceToNearestVowel('ShoppEr')); // [2, 1, 0, 1, 1, 0, 1];

// no vowels
console.log(distanceToNearestVowel('shppr')); // [NaN, NaN, NaN, NaN];

// with non letters
console.log(distanceToNearestVowel('I am')); // [0, 1, 0, 1];
