/**
 * write a function that takes an object and returns, as a string, the characters at the value's prime index positions. Insert a space after each third character
 *
 * let example = {
 * property: '..YO.U.D...I.D...I.T...!'
 * }
 *
 * primeLetters(example) = 'YOU DID IT!'
 */

/*
Input: object
Output: a string including characters according to the rules

Rules:
  Chars that are at prime index positions are included in the result string
  Insert a space after every third character in the result string
  The object always have one key, but its value is arbitrary

  Prime number
    greater than 1
    divisible by only 1 and itself
Example:
  {
  property: 'XXYOXUXD';
  }
  
  Access the object's value
  'XXYOXUXD'
  
  ['X', 'X', 'Y'..., 'D'] convert to array of chars
  ['Y', 'O', 'U', 'D'] filter only chars at prime index (helper function that checks if a number is prime)
  

Algorithm:
  First get the string value from the object
    get the get from the object  (Object.keys(input) [key][0])
    Access the value of the object using the key inputObject[key]
  
  Expand the string into an array of chars
  
  Filter the chars array based on if the index of the char is prime
    Filter with index
      Check if the current index is prime
  
  
  Build the result string
    Start by building from an empty string ""
    Have a counter that starts at 0
    Iterate through the array of prime chars, 
      Add the char to the result string
      increment the counter by 1
      Check if the current counter is equal to number 3, 
        if it is, add a space to the result string
        reset the counter to 0;
  
  
  isPrime
    reuturn true if the number is 
    greater than 1
    only divisible by itself
      Iterate every value from 2 to the number itself
        if any of the factor can divide into the number, return false
      return true
*/

function primeLetters(object) {
  if (typeof object !== 'object' || Array.isArray(object)) return;
  let key = Object.keys(object)[0];

  let objectValue = object[key];
  let objectChars;

  if (typeof objectValue === 'string') {
    objectChars = objectValue.split('');
  } else if (!Array.isArray(objectValue)) {
    return;
  } else {
    objectChars = objectValue;
  }

  let primeChars = objectChars.filter((char, index) => {
    return isPrime(index);
  });

  let result = '';
  let count = 0;

  primeChars.forEach((char) => {
    result += char;
    count += 1;
    if (count === 3) {
      result += ' ';
      count = 0;
    }
  });
  return result;
}

function isPrime(number) {
  if (number <= 1) return false;
  for (let index = 2; index < number; index += 1) {
    if (number % index === 0) return false;
  }
  return true;
}

let example1 = {
  property: '1.YO5U.D&*3IlDeoiIDT. .!',
};

console.log(primeLetters(example1));

let example2 = {
  property2: '1.YO5U.D&*3IlDeoiIDT. .!',
};

console.log(primeLetters(example2));

// empty string
let example3 = {
  property2: '',
};
console.log(primeLetters(example3));
console.log(primeLetters(''));
console.log(primeLetters([]));

let another_example = {
  property: ['1', '.', 'Y', 'O', '5', 'U'],
};
console.log(primeLetters(another_example)); // 'YOU'
