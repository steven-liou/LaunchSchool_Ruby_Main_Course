function isNaN(value) {
  return value !== value;
}

console.log(isNaN(NaN));
console.log(isNaN(5));
console.log(isNaN('a'));
console.log(isNaN({}));
console.log(isNaN(true));
console.log(isNaN(undefined));
console.log(isNaN(null));
