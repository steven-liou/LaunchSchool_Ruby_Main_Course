function myForEach(array, func) {
  for (let index = 0; index < array.length; index += 1) {
    let value = array[index];
    func(value, index, array);
  }
}

let min = Infinity;
let getMin = (value) => (min = value <= min ? value : min);
myForEach([4, 5, 12, 23, 3], getMin);
console.log(min);
