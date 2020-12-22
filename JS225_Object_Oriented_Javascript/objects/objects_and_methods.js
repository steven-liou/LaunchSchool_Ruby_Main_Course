let greeter = {
  morning() {
    console.log('Good morning!');
  },
};

function evening() {
  console.log('Good evening');
}

greeter.morning();
evening();

let functionGreeter = greeter.morning;
functionGreeter();

let counter = {
  count: 0,
  advance() {
    this.count += 1;
  },
};

console.log(counter);
counter.advance();
console.log(counter);
counter.advance();
counter.advance();
console.log(counter);

let car = {
  fuel: 7.8,
  running: false,
  start() {
    this.running = true;
  },
};

car.stop = function () {
  this.running = false;
};

car.drive = function (distance) {
  this.fuel -= distance / 52;
};

car.drive(52);
