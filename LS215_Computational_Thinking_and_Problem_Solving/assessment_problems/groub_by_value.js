// Create a function that takes in an array of numbers or strings and returns an array with the items from the original array stored in subarrays. Items of the same value should be in the same subarray.
//

/*
input: array of numbers or strings
output: an array with the items of same value from the original array stored in subarrays 

Rules:
  The order of the subarrays depend on the first occurance of the values in the original array
 
Examples:
  []
  [1, 1, '1', 'hi']
  
  
  
  Check if the result array's elements have the current value
    if so, add to that subarray
    else, add another subarray with current value to result array
  [[1]]
  [[1, 1]]
  [[1,1], ['1']]
  [[1,1], ['1'], ['h1']]
  
  [1, '1', 'h1']
  
Data structre:
  An array storin the subarray of same values

Algorithm:
  Create a result array
  
  iterate through the input array
    Check if any of the result array's subarrays contain the current array value
      if true
        get the index of that subarray
        Push the current value into that result's subarray
      else
        push a new subarray containing the current value into the result array
   
 return the result array 
*/

function groupByValue(array) {
  let result = [];
  array.forEach((value) => {
    if (result.some((subarray) => subarray.indexOf(value) !== -1)) {
      for (let index = 0; index < result.length; index += 1) {
        let subarray = result[index];
        if (subarray.indexOf(value) !== -1) result[index].push(value);
      }
    } else {
      result.push([value]);
    }
  });
  return result;
}

function groupByValue(arr) {
  let result = [];

  arr.forEach((value) => {
    let subarrStaringValues = result.map((subarr) => subarr[0]);
    let idxOfCurrentValue = subarrStaringValues.indexOf(value);

    if (idxOfCurrentValue >= 0) {
      result[idxOfCurrentValue].push(value);
    } else {
      result.push([value]);
    }
  });

  return result;
}

console.log(groupByValue([1, 1, '1', 'hi'])); //=== [[1, 1], ['1'], ['hi']]);
console.log(groupByValue([1])); //=== [[1]]);
console.log(groupByValue(['hi'])); //=== [['hi']]);
console.log(groupByValue([3, 2, -6, 5, -6])); // [[3], [2], [-6, -6], [5]]
console.log(groupByValue([3, 2, 6, 2, 5])); // [[3], [2, 2], [6], [5]]

// with empty strings
console.log(groupByValue([1, 1, '1', '', '', 'hi'])); //=== [[1, 1], ['1'], ['', ''] ['hi']]);g
