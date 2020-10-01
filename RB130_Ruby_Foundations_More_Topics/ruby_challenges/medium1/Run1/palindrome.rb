=begin

Input : given a word

Output : whether the given word is a palindrome

Rules
  cannot use reverse
  cannot use regex
  ignore non letter characters
Data structure / Algorithms
  first create a character set of upper and lowercase letters, array
  remove the given string's non-letter characters, store it into a new array
    - iterate through each character in the given string, check if the current character is in letter array
    - if it is, select the character

    create a bool to check if the string is a palindrome
    - find the index of the middle character in the array (n - 1) /2
    - iterate from index 0 to the middle of the array,
      check if the character of the current index is equal to the character at n - index - 1
=end

CHARS = ('a'..'z').to_a + ('A'..'Z').to_a

def palindrome?(string)
  chars = string.chars.select { |char| CHARS.include?(char) }

  size = chars.size
  middle = (size - 1) % 2

  0.step(middle).all? { |index| chars[index] == chars[size - index - 1] }
end

p palindrome?("no1, 3on")
p palindrome?('redder')
p palindrome?('rotor')
p palindrome?('')