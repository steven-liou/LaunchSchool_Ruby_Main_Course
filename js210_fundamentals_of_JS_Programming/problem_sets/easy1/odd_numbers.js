// Log all odd numbers from 1 to 99, inclusive, to the console. Log all numbers on separate lines.

const readlineSync = require('readline-sync');

limit = readlineSync.question('Print odd numbers up to what number? ');

for (let i = 1; i <= limit; i += 2) {
  console.log(i);
}
