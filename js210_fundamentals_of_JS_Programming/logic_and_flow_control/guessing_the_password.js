const readlineSync = require("readline-sync");

const PASSWORD = "password";

let attempts = 3;

while (attempts > 0) {
  input = readlineSync.question("What is the password: ");

  if (input === PASSWORD) {
    break;
  } else {
    console.log("Wrong password, try again");
  }
  attempts--;
}

if (attempts === 0) {
  console.log("You have been denied access");
} else {
  console.log("You have successfully logged in.");
}
