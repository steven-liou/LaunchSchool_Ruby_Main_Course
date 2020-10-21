function makeCounter() {
  let counter = 0;

  return function () {
    counter += 1;
    return counter;
  };
}

let incrementCounter = makeCounter();
console.log(incrementCounter());
console.log(incrementCounter());
