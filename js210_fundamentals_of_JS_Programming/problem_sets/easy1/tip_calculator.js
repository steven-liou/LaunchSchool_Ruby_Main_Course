let readlineSync = require('readline-sync');
let bill = readlineSync.question('What is the bill? ', { limit: /[\d.]/ });
bill = parseFloat(bill);
let tipPercent = readlineSync.question('What is the tip tip percentage? ', { limit: /[\d.]/ });
tipPercent = parseFloat(tipPercent) / 100;
let tip = tipPercent * bill;
let total = bill + tip;

console.log(`The tip is ${tip.toFixed(2)}`);
console.log(`The total is ${total.toFixed(2)}`);
