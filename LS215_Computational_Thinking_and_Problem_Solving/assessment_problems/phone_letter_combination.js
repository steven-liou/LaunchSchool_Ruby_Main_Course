/*
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
2 : 'abc'
3 : 'def'
4 : 'ghi'
5 : 'jkl'
6 : 'mno'
7 : 'pqrs'
8 : 'tuv'
9 : 'wxyz'
*/

/*
Input: a string of phone number
Output: an array of all possible letter combinations that the number could represent
Rules: 
  Each number can be represented by a set of letters
  
Examples:
  '23'
  ['2', '3']
  
  Transform from number to possible letters
  ['abc', 'def']

  Transform into arrays of char
  [['a', 'b', 'c'], ['d', 'e', 'f']]
    Iterate through each element in the first array,
      iterate through each element in the second array
        concatenate the first array's element with the second array's element
        push it into a combo array

  Get all possible combinations from the two subarrays
  ['ad', 'ae', 'af', 'bd', 'be', 'bf']



Data Structure:
  create a hash with key of number, and value of the possible letters for that number
  an array that stores the final combination results

Algorithms:
  Split the input number string into array of numbers (string)

  Transform the numberString array into the array of subarrays of letters
    Lookup the letters for the number using the table
    split the letters by chars ['a', 'b', 'c']

  Set the result array to the first array 
  Find all combination of the result array with the next array in the list, starting at index 1
    

  To find all combination between two arrays
    Create a combo array
    Iterate through each element in the first array,
      iterate through each element in the second array
        concatenate the first array's element with the second array's element
        push it into a combo array
*/
const PHONE_NUMBERS = {
  2: 'abc',
  3: 'def',
  4: 'ghi',
  5: 'jkl',
  6: 'mno',
  7: 'pqrs',
  8: 'tuv',
  9: 'wxyz',
};

function letterCombinations(numberString) {
  let lettersArray = numberString.split('').map((numberChar) => PHONE_NUMBERS[numberChar].split(''));

  let result = lettersArray.shift();

  lettersArray.forEach((letters) => {
    result = allCombination(result, letters);
  });
  return result;
}

function allCombination(array1, array2) {
  let combos = [];

  array1.forEach((ele1) => {
    array2.forEach((ele2) => {
      combos.push(ele1 + ele2);
    });
  });
  return combos;
}

console.log(letterCombinations('23')); // ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]

console.log(letterCombinations('532')); // ["jda", "jdb", "jdc", "jea", "jeb", "jec", "jfa", "jfb", "jfc", "kda", "kdb", "kdc", "kea", "keb", "kec", "kfa", "kfb", "kfc", "lda", "ldb", "ldc", "lea", "leb", "lec", "lfa", "lfb", "lfc"]
