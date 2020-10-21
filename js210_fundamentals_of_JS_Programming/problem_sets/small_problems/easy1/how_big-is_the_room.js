const SQUARE_METER_TO_FEET = 10.7639;
let rls = require('readline-sync');

let length = Number(rls.question("Enter the length of the room in meters:\n"));
let width = Number(rls.question("Enter the width of the room in meters:\n"));

let squareMeter = length * width;
let squareFeet = squareMeter * SQUARE_METER_TO_FEET;
console.log(`The area of hte room is ${squareMeter} (${squareFeet.toFixed(2)} square feet).`);