function isEmpty(value) {
  let type = typeof value;
  if (type === 'string') {
    return value.length === 0;
  } else if (Array.isArray(value)) {
    return value.length === 0 || Object.keys(value).length === 0;
  } else if (type === 'object') {
    return Object.keys(value).length === 0;
  }
}

// current test cases
console.log(isEmpty({})); // true
console.log(isEmpty({ name: 'Janice' })); // false

console.log(isEmpty('')); // true
console.log(isEmpty('Janice')); // false

console.log(isEmpty([])); // true
console.log(isEmpty(['Janice'])); // false

let test = [];
test.length = 1;
console.log(isEmpty(test)); // true
