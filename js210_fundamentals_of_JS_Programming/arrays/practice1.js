function toString(array) {
  let string = '';
  for (let index = 0; index < array.length; index++) {
    string += String(array[index]);
  }
  return string;
}

console.log(toString([1, 'a', 4]));
