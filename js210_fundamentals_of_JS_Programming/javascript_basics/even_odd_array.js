let myArray = [
  1, 3, 6, 11,
  4, 2, 4, 9,
  17, 16, 0,
];
// Desired result:
//  [
//    'odd', 'odd', 'even', 'odd',
//    'even', 'even', 'even', 'odd',
//    'odd', even', 'even',
//  ]

let result = myArray.map(function (value) {
  return value % 2 === 0 ? 'even' : 'odd';
});

console.log(result);

for (slkj) {

}
