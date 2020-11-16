/*
Suppose you have an arbitrary natural number (the target) and a set of one or more additional natural numbers (the factors). Write a program that computes the sum of all numbers from 1 up to the target number that are also multiples of one of the factors. 
For instance, if the target is 20, and the factors are 3 and 5, that gives us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.
If no factors are given, use 3 and 5 as the default factors.

*/

/*
Input: A number, and an array of factors
Output: sum of all numbers from 1 up to the target number (not including) that are also multiples of one of the factors 
Rules: 
 A factor of a number can divide into that number without remainder 
 if no factor is given, use [3, 5] as default

Examples:
  20, [ 3, 5]
  1, 2, 3, 4, 5, 6, ... 
  
  check if the current number can be divided by any of the factors, if so, add it to the sum
  3, 5, 6, 9, 10, 12, 15, 18
  3 8 11 ... 

Data Structure:
   a number that holds the sum of numbers up to the target number that can be divided by one of the factors
   

Algorithms:
  create a sum variable that starts at 0

  iterate from 1 to the target number
    check if the current number can be divided by one of the factors, if so, add the current number to sum

  return sum
*/

function sumOfFactors(targetNumber, factors = [3, 5]) {
  if (factors.length === 0) factors = [3, 5];
  let sum = 0;

  for (let number = 1; number < targetNumber; number += 1) {
    if (factors.some((factor) => number % factor === 0)) sum += number;
  }
  return sum;
}

console.log(sumOfFactors(20)); // 78
console.log(sumOfFactors(20, [3])); // 63
console.log(sumOfFactors(20, [3, 5])); // 78
console.log(sumOfFactors(20, [5])); // 30
console.log(sumOfFactors(20, [])); // 78
console.log(sumOfFactors(1, [])); // 0
console.log(sumOfFactors(20, [19])); // 19
