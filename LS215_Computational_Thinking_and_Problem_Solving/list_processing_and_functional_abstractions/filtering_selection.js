function myFilter(array, func) {
  let filteredArray = [];

  myForEach(array, (value) => {
    if (func(value)) filteredArray.push(value);
  });
  return filteredArray;
}

function myForEach(array, func) {
  for (let index = 0; index < array.length; index += 1) {
    let value = array[index];
    func(value, index, array);
  }
}

let isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

console.log(
  myFilter(
    [
      { a: 3, b: 4, c: 5 },
      { a: 5, b: 12, c: 13 },
      { a: 1, b: 2, c: 3 },
    ],
    isPythagoreanTriple
  )
);

// returns [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ]
