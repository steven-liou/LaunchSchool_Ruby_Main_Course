/*

Write a program that takes a string as input and returns a count of how many words in the string can be rearranged to form palindromes. You may assume that input strings are at least 1 character in length and contain only alphabetic characters. You may ignore case for the purpose of assessing possible palindromes.
ex. Processing the string “aaa bca Abab” should return the integer 2 because “aaa” is already a palindrome and “Abab” can be rearranged to “Abba”, which is also a palindrome (case insensitive). Thus, two of the three words in the string can be made into palindromes.
*/

function palindromeCounter() {}

console.log(palindromeCounter('a')); // 1 (“a”)
console.log(palindromeCounter('a')); // 1 (“a”)
console.log(palindromeCounter('ab')); // 0
console.log(palindromeCounter('Abc Def G')); // 1 (“g”)
console.log(palindromeCounter('abbAc C ddEf')); // 2 (“abcba”, “c”)
console.log(palindromeCounter('lmn opq rst')); // 0
console.log(palindromeCounter('AAA bAbbB')); // 2 (“aaa”, “bbabb”)
