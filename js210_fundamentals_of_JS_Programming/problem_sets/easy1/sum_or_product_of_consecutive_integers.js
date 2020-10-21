let readlineSync = require('readline-sync');

let input = readlineSync.question('Please enter an integer greater than 0: ', { limit: /[0-9]/ });
let number = parseInt(input);
let operator = readlineSync.question('Enter "s" to compute the sum, or "p" to comput the product ', {
  limist: ['s', 'p'],
});

switch (operator) {
  case 's':
    let sum = computeSumOfIntegers(number);
    console.log(`The sum of the integers between 1 and ${number} is ${sum}`);
    break;
  case 'p':
    let product = computeProductOfIntegers(number);
    console.log(`The product of the integers between 1 and ${number} is ${product}`);
    break;
  default:
    console.log('Oops Unkown Operation');
}

function computeSumOfIntegers(number) {
  let sum = 0;

  for (let index = 1; index <= number; index++) {
    sum += index;
  }
  return sum;
}

function computeProductOfIntegers(number) {
  let product = 1;

  for (let index = 1; index <= number; index++) {
    product *= index;
  }
  return product;
}
