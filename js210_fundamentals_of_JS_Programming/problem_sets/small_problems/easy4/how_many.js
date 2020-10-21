function countOccurrences(array) {
  return array.reduce((hash, ele) => {
    hash[ele] = (hash[ele] || 0) + 1;
    return hash;
  }, {});
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'];

console.log(countOccurrences(vehicles));

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
