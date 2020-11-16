/*
Write a function that determines if two inputs share an anagram that is also a palindrome
Anagram - a word that can be created by scrambling the letters of another word (E.g. 'naan' and 'nana')
Palindrome - a word that reads the same backwards as forwards (E.g. 'anna' or 'racecar')
*/

/*
Input: two strings
Output: true/false if the two input strings share an anagram that is also a palindrome

Rules:
  Anagrams: a word with same letters, but different orders
  Palindrome: a word that reads the same fowrads and backwards
  Ignore non-letter characters
  

Examples:
  'naan', 'nana'
  
  - convert the strings into an array of chars, and sort the char arrays
  ['a', 'a', 'n', 'n'],  ['a',' a', 'n','n']
  
  - compare if the two arrays' values are the ame
    if not the same, return false
  
  ['a', 'a', 'n', 'n'],  'anna'
    if its a palindrome, the number of chars of a same letter is even
  ['a', 'a',  'n', 'n', 'o'] 'anona'
  ['a', 'a',  'n', 'n', 'o', 's'] 'anonsa' 
  
  go through the object by values, if the odd numbers is greater than 1, then return false, 
  else return true
  {
    a: 2,
    n: 2,
    o: 1,
    s: 1,
  
  }
  Havce a number that keeps track of the number of odd occurances of a letter

Data structure:
  array of chars
  Object with key/value of letter:count
  
Algorithms:
  Check if either string is empty, if true, return undefined
  Match the letters of the strings, into two arrays of chars
  
  Determine if the two strings are anagrams
    - sort the two arrays of chars in ascending order
    - compare if the values of the two arrays are the same (iteration by for loop)
      - if not the same, return false
  
  Determine if a string is possible palindrome
   - convert the array of chars into an object with key of letter, and value of the occurances of that letter
   
   - find the number of odd occurances in the object (iteration by for loop)
    - if the number of odd occurances is greater than 1, return false 
    - else return true
    
    - iterate through the object's values 
      - create a number for counting the number of odd occurances
      - if the number of occurance is odd, increment the count, else continue    
      - if the count is greater than 1, return false
*/

function sharedPalindrome(string1, string2) {
  if (string1 === '' || string2 === '') return;
  let charsArray1 = string1.match(/[a-z]/gi).sort();
  let charsArray2 = string2.match(/[a-z]/gi).sort();
  if (!sameValues(charsArray1, charsArray2)) return false;

  let charsCount = charsArray1.reduce((result, char) => {
    result[char] = (result[char] || 0) + 1;
    return result;
  }, {});

  let oddsCount = 0;

  let values = Object.values(charsCount);

  for (let index = 0; index < values.length; index += 1) {
    if (values[index] % 2 !== 0) oddsCount += 1;
    if (oddsCount > 1) return false;
  }
  return true;
}

function sameValues(array1, array2) {
  if (array1.length !== array2.length) return false;

  for (let index = 0; index < array1.length; index += 1) {
    if (array1[index] !== array2[index]) return false;
  }
  return true;
}

console.log(sharedPalindrome('naan', 'nana')); // true
console.log(sharedPalindrome('naanot', 'tonana')); // false
console.log(sharedPalindrome('football', 'baseball')); // false

// single char
console.log(sharedPalindrome('a', 'a')); // true

// if either input is empty, return undefined
console.log(sharedPalindrome('', 'nana')); // undefined

// do not consider non-alpha characters
console.log(sharedPalindrome('racecar', 'car-race')); // true

console.log(sharedPalindrome('nnaaa', 'aaann')); // true

// if either input is a number, convert the number to a string
// sharedPalindrome(366, '663');                        // true - it would be '636's
