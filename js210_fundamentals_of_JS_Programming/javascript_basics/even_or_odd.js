function evenOrOdd(number) {
  if (!Number.isInteger(number)) return 'Only accepts number';
  return number % 2 === 0 ? 'even' : 'odd';
}

console.log(evenOrOdd((1)));
console.log(evenOrOdd(2));

console.log(evenOrOdd('hello'));
