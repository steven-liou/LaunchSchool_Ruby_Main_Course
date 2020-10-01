// function fizzbuzz() {
//   for (let index = 1; index <= 100; index++) {
//     let message = index;
//     if (index % 3 === 0 && index % 5 === 0) {
//       message = "FizzBuzz";
//     } else if (index % 3 === 0) {
//       message = "Fizz";
//     } else if (index % 5 === 0) {
//       message = "Buzz";
//     }
//     console.log(message);
//   }
// }

function fizzbuzz() {
  for (let index = 1; index <= 100; index++) {
    let message = "";

    if (index % 3 == 0) message += "Fizz";
    if (index % 5 == 0) message += "Buzz";

    console.log(message || index);
  }
}

fizzbuzz();
