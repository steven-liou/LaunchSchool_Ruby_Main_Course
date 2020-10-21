function totalArea(rectangles) {
  let squares = rectangles.filter((sides) => sides[0] === sides[1]);
  let areas = squares.map((sides) => sides[0] * sides[1]);
  return areas.reduce((total, area) => (total += area), 0);
}

let rectangles = [
  [3, 4],
  [6, 6],
  [1, 8],
  [9, 9],
  [2, 2],
];

console.log(totalArea(rectangles)); // 121
