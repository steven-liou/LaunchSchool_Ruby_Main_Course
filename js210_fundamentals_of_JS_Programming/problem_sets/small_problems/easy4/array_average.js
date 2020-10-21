function average(array) {
  let average = array.reduce((sum, val) => sum + val, 0) / array.length;
  return Math.floor(average);
}
console.log(average([1, 5, 87, 45, 8, 8]));       // 25
console.log(average([9, 47, 23, 95, 16, 52]));    // 40
