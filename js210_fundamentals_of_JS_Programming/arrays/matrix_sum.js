function matrixSums(arr) {
  return arr.map((subarr) => subarr.reduce((total, val) => total + val));
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]])); // returns [15, 60, 12]

