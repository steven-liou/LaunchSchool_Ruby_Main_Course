# PEDAC
- ## Problem Identification
- ## Examples: test cases
- ## Data structure selections
- ## Algorithm imiplementation
- ## Coding implementation

## Identify the problem:

### Input: string

### output: new string

### rules:

    Explicit requirements:
    - every palindrome in the string must be converted to uppercase
    - Palindromes are case sensitivei ("Dad" is not a palindrome, but "dad" is)

    Implicit requirements:
    - the returned string shoudln't be the same string object


## Data Structure / Algorithm
Data strucutres influence your algorithms, therefore these two steps are often paired

Consider a new problem

```
Problem 2

 Given a string, write a method `palindrome_substrings` which returns all the substrings from a given string which are palindromes. Consider palindrome words case sensitive.

 Test cases:

 palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
 palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
 palindrome_substrings("palindrome") == []
 palindrome_substrings("") == []

 Input: string

 output: array of strings containing palindrome substrings
 
  rules: 
      Explicit requirements:
      - return only substrings which are palindromes
      - palindrome words should be case sensitive, meaning 'abBA' is not a palindrome


Data structure:
  array

Alogorithm:
substrings method
=================
  - initialize a result variable to an empty array
  - initialize variables start_substring_idx and assign 0 to it
  - initialize variable end_substring_idx, and assign start_substring_idx + 1 to it
  - Enter loop which will break when start_substring_idx is equal to str.size
  - Within that loop, enter another loop that will break if end_substring_idx is equal to str.size
    - append to the result array part of the string from start_substring_idx to end_substring_idx
    - increment end_substring_idx by 1
  end the inner loop
  - increment start_substring_idx by 1
  - reassign end_substring_idx to start_substring_idx += 1
  end outer loop
  return result
  
  is_palindrome? method
  ======================
  - if the word is a palindrome, append it to the result array

  palindrome_substrings method
  =============================
  - initialize a result variable to an empty array
  - create an array named substring_arr that contains all of the substrings of the input string that are at least 2 characters long
  - loop through the words in the substring_arr array
    - if the word is a palindrome, append it to the result array
  - return the result array
