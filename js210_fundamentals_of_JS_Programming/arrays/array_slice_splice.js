function slice(array, begin, end) {
  if (begin > array.length) begin = array.length;
  if (end > array.length) end = array.length;
  let subArray = [];
  for (let index = begin; index < end; index += 1) {
    subArray[index - begin] = array[index];
  }
  return subArray;
}

// console.log(slice([1, 2, 3], 1, 2)); // [2]
// console.log(slice([1, 2, 3], 2, 0)); // []
// console.log(slice([1, 2, 3], 5, 1)); // []
// console.log(slice([1, 2, 3], 0, 5)); // [1, 2, 3]

// const arr1 = [1, 2, 3];
// console.log(slice(arr1, 1, 3)); // [2, 3]
// console.log(arr1); // [1, 2, 3]

function splice(array, start, deleteCount, ...elements) {
  if (start > array.length) start = array.length;
  if (deleteCount > array.length - start) deleteCount = array.length - start;

  let copyArray = slice(array, 0, array.length);
  let deleteArray = slice(array, start, start + deleteCount);

  array.length = array.length + elements.length - deleteCount;

  for (let index = 0; index < elements.length; index += 1) {
    array[index + start] = elements[index];
  }

  let addBackIndex = start + deleteCount;

  for (let index = addBackIndex; index < copyArray.length; index += 1) {
    array[index + elements.length - deleteCount] = copyArray[index];
  }
  return deleteArray;
}

console.log(splice([1, 2, 3], 1, 2)); // [2, 3]
console.log(splice([1, 2, 3], 1, 3)); // [2, 3]
console.log(splice([1, 2, 3], 1, 0)); // []
console.log(splice([1, 2, 3], 0, 1)); // [1]
console.log(splice([1, 2, 3], 1, 0, 'a')); // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two')); // [2]
console.log(arr2); // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three')); // [2, 3]
console.log(arr3); // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0)); // []
console.log(splice(arr4, 1, 0, 'a')); // []
console.log(arr4); // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a')); // []
console.log(arr5); // ["a", 1, 2, 3]
