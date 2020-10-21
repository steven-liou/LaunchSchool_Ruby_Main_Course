function push(array, element) {
  array[array.length] = element;
}

let count = [0, 1, 2];
push(count, 3);
console.log(count);
