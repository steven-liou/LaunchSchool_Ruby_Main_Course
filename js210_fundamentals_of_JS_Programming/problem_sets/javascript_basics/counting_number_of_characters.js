let readlineSync = require("readline-sync");

console.log("Enter a phrase: walk)");

const phrase = readlineSync.prompt();
const numberOfCharacters = String(phrase.replace(/[^A-Za-z]/g, "").length);
console.log(`There are ${numberOfCharacters} characters in '${phrase}'`);
