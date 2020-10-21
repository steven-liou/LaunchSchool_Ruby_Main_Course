/*
Input: a year 
Output: the century the year is in 
Rules: 
  if the century number is appended with th unless
    the century ends in 1, 2, 3, which ends in st, nd, rd, respectively, unless
    the last two digits of the century is 11, 12, and 13



Data Structure:
  

Algorithms:
  convert the year into century by integer division by 100
  if there is remainder, then increment the century number by 1

  if the century's last two digits are 11, 12, and 13, append th
  if the century's last digit is 1, append st, 2, nd, 3 rd
  else append th
  
  returen the result
*/

function century(year) {
  let centuryNum = Math.floor(year / 100);
  if (year % 100 !== 0) centuryNum += 1;

  return String(centuryNum) + centurySuffix(centuryNum);
}

function centurySuffix(centuryNumber) {
  let lastTwoDigits = centuryNumber % 100;
  let lastDigit = centuryNumber % 10;

  if ([11, 12, 13].indexOf(lastTwoDigits) !== -1) return 'th';

  switch (lastDigit) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

console.log(century(2000)); // "20th"
console.log(century(2001)); // "21st"
console.log(century(1965)); // "20th"
console.log(century(256)); // "3rd"
console.log(century(5)); // "1st"
console.log(century(10103)); // "102nd"
console.log(century(1052)); // "11th"
console.log(century(1127)); // "12th"
console.log(century(11201)); // "113th"
