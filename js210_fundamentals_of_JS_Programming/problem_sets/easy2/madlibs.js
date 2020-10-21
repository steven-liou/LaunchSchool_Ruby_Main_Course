let readlineSync = require('readline-sync');

let noun = readlineSync.question('Enter a noun: ');
let verb = readlineSync.question('Enter a verb: ');
let adjective = readlineSync.question('Enter a adjective: ');
let adverb = readlineSync.question('Enter a adverb: ');

console.log(`Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`);
