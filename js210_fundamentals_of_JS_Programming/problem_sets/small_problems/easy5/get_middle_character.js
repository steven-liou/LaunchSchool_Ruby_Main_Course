function centerOf(string) {
  let length = string.length;
  let middle = Math.floor(length / 2);
  let middleChar = string[middle];
  if (length % 2 === 0) middleChar = string[middle - 1] + middleChar;
  return middleChar;
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"
