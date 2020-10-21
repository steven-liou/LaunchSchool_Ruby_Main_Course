let foo = [1, 2, 3];
let [first, second, third] = foo;

let bar = [1, 2, 3, 4, 5, 6, 7];
let [first, , , fourth, fifth, , seventh] = bar;

let one = 1;
let two = 2;
let three = 3;

let [num1, num2, num3] = [one, two, three];

let foo = [1, 2, 3];
let bar = [4, 5, 6];
let qux = [...foo, ...bar];
