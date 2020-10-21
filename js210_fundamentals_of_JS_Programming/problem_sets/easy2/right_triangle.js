function triangle(rows) {
  let spaces = rows - 1;
  let stars = 1;

  for (let index = 0; index < rows; index++) {
    console.log(' '.repeat(spaces) + '*'.repeat(stars));
    stars += 1;
    spaces -= 1;
  }
}

triangle(5);
triangle(9);
