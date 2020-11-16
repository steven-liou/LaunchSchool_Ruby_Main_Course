/*
While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:

1
1.0
1.2
3.2.3
3.0.0
4.2.3.0

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

If version1 > version2, we should return 1.
If version1 < version2, we should return -1.
If version1 === version2, we should return 0.
If either version number contains characters other than digits and the '.' character, we should return null.

Here is an example of version number ordering:
0.1 < 1 = 1.0 < 1.1 < 1.2 = 1..0.0 < 1.18.2 < 13.37

*/
/*
Input: Two strings representing version numbers
Output:  a number indicating which version number is greater/eual/less
Rules: 
  The individual parts of a version number is separated by the '.' char
  If a version number has shorter length than the other version number, fill the missing parts with 0
  The parts are compared between the two version numbers, one at a time
    If there is any differenc between the two parts, return the result that one is greater/less to the other
  If no difference between the parts are found, they are equal
  
Examples:
  1.0,  1
  [1, 0],  [1, 0]

  1.2, 1.18.2
  [1, 2, 0], [1, 18, 2]
  

Data Structure:
  an array that stores a version number's parts
  

Algorithms:
  validate the two version numbers
    Check if the string starts with a number char
    Check if the string's remaining parts are separated by '.' followed by a number (ending)
    Check if the string has only numbers and '.'
    if not valid, return null

  Turn a version number into its parts
    Separate the string by '.', transform the number char into Number type

  Modify the two number arrays so that their lengths are the same
    Find the max length of the two arrays
    If an array's length is less than the max array length, fill the array with 0 until its length is eqaul to max length

 Compare the two arrays' values one at a time
  if version1's value is less than the second array's value, return -1
  If version1's value is greater than version2's value, return 1

return 0 when there is no difference between the two version numbers

*/

function compareVersions(version1, version2) {
  if (!validateVersion(version1) || !validateVersion(version2)) return null;

  let version1Parts = versionToParts(version1);
  let version2Parts = versionToParts(version2);

  [version1Parts, version2Parts] = fixVersionLengths(version1Parts, version2Parts);

  for (let index = 0; index < version1Parts.length; index += 1) {
    if (version1Parts[index] < version2Parts[index]) {
      return -1;
    } else if (version1Parts[index] > version2Parts[index]) {
      return 1;
    }
  }

  return 0;
}

function fixVersionLengths(array1, array2) {
  array1 = array1.splice(0);
  array2 = array2.splice(0);

  let maxLength = Math.max(array1.length, array2.length);
  if (array1.length < maxLength) {
    array1 = fillZeros(array1, maxLength);
  } else if (array2.length < maxLength) {
    array2 = fillZeros(array2, maxLength);
  }

  return [array1, array2];
}

function fillZeros(array, length) {
  while (array.length < length) {
    array.push(0);
  }
  return array;
}

function validateVersion(numberString) {
  return /^\d+(\.\d+)*$/.test(numberString);
}

function versionToParts(numberString) {
  return numberString.split('.').map(Number);
}

console.log(compareVersions('0.1', '1')); // -1
console.log(compareVersions('1', '1.0')); // 0
console.log(compareVersions('1.0', '1.1')); // -1
console.log(compareVersions('1.1', '1.2')); // -1
console.log(compareVersions('1.2', '1.2.0.0')); // 0
console.log(compareVersions('1.2', '1.2.0.0')); // 0
console.log(compareVersions('1.2.0.0', '1.18.2')); // -1
console.log(compareVersions('1.18.2', '13.37')); // -1
console.log(compareVersions('13.37', '1.18.2')); // 1

// version number doesn't start or end with a numerical number
console.log(compareVersions('.2', '1.2.0.0')); // null
console.log(compareVersions('2.', '1.2.0.0')); // null

// consecutive '.'
console.log(compareVersions('2..2', '1.2.0.0')); // null

// version number includes characters other than numbers and '.'
console.log(compareVersions('a.2', '1.2.0.0')); // null

// empty string
console.log(compareVersions('', '1.2.0.0')); // null
console.log(compareVersions('', '1.2.0.0')); // null
