// Given a number, return a string with dash'-'marks before and after each odd integer, but do not begin or end the string with a dash mark.
//
// Ex:
//
// dashatize(274) //-> '2-7-4'
// dashatize(6815) //-> '68-1-5'

/*
Input: a number
Output: a string with '-' marks before and after each odd integer
Rules:
  Do not start or end the output string with a '-'
  add '-' before and after odd integer
  

Examples:
  274
  '274'
  ['2' ,'7', '4']
  [2, 7 , 4]
  ['2', '-7-', '4']
  '2-7-4'
  
  3815
  [3, 8, 1, 5]
  if beginning index
  ['3-', '8', '-1-', '-5']
                     if at the end index, prepend '-' only
  
Data STructure
  an array of numbers
  an array of strings
  string

Algorithm
 Convert the number into a string
 Split the string by char into an array of char
 Transform the array of chars into an array of numbers
 
 Transform the array of numbers (with index) to array of dashed numbers, 
  If the number is even, return string version of the number
  
  create a result string = ''
  
  else number is odd
  `if the index is 0 , don't prepend the '-'
   else
    prepend the dash
   
   add the string of number
   
   if index is length of array - 1,
    don't append the '-'
   else 
    append the dash
   
   return the result string
  
 join the transformed array by '', return it
    
*/

function dashatize(number) {
  if (Number.isNaN(number)) return 'NaN';
  number = Math.abs(number);

  let numbers = String(number).split('').map(Number);

  let dashNumberStrings = numbers.map((number, index) => {
    if (number % 2 === 0) return String(number);

    let result = '';

    if (index !== 0 && numbers[index - 1] % 2 === 0) {
      result += '-';
    }
    result += String(number);
    if (index !== numbers.length - 1) {
      result += '-';
    }
    return result;
  });

  return dashNumberStrings.join('');
}

console.log(dashatize(274)); // '2-7'4'
console.log(dashatize(6815)); // '68-1-5'

// no - in the beginning of the string
console.log(dashatize(3815)); // '3-68-1-5'
console.log(dashatize(974302)); //, "9-7-4-3-02", "Should return 9-7-4-3-02");
console.log(dashatize(NaN)); //, "NaN", "Should return NaN");
console.log(dashatize(0)); //, "0", "Should return 0");
console.log(dashatize(-1)); //, "1", "Should return 1");
console.log(dashatize(-28369)); //, "28-3-6-9", "Should return 28-3-6-9");
