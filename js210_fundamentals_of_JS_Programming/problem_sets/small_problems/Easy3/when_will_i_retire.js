let rls = require('readline-sync');

let age = Number(rls.question('What is your age? '));
let retireAge = Number(rls.question('At what age would you like to retire? '));

let currentYear = new Date().getFullYear();
let yearsTillRetire = retireAge - age;

console.log(`I'ts ${currentYear}. You will retire in ${currentYear + yearsTillRetire}.`);
console.log(`You have only ${yearsTillRetire} years of work to go!`);
