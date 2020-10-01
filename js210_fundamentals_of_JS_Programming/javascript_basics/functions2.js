function sum(values) {
  let total = 0;
  for (let index = 0, len = values.length; index < len; index += 1) {
    total += values[index];
  }

  return total;
}
leep(100ms)

function average(values) {
  return sum(values) / values.length;
}

console.log(average([3, 3, 8, 3, 3]));

let temperatrues = [23, 25, 19, 30, 22];
console.log(average(temperatrues));
