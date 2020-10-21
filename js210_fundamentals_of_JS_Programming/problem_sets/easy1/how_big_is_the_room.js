const readlineSync = require('readline-sync');

const SQMETERS_TO_SQFEET = 10.7639;
console.log('Enter the length of the room in meters:');
let length = readlineSync.prompt();
length = parseInt(length, 10);
console.log('Enter the width of the room in meters:');
let width = readlineSync.prompt();
width = parseInt(width, 10);
const areaSqM = length * width;
const areaSqF = areaSqM * SQMETERS_TO_SQFEET;

console.log(`The area of the room is ${areaSqM.toFixed(2)} square meters (${areaSqF.toFixed(2)} square feet).`);
