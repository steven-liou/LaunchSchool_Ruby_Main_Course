# Write a method that takes a string input, and returns the first character that is not repeated anywhere in the string.
#
# For example, if given the input 'stress', the method should return 't', since the letter t only occurs once in the string, and occurs
#first in the string.
#
# Upper- and lowercase letters are considered the same character, but the method should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.
#
# If a string contains all repeating characters, it should return an empty string ("")


=begin

=begin

Input: a string

Output: first character that is not repeated,

Rules
  case insentitve in terms of the repeat count
  must return the original character case
  if all characters are repeats, return empty string

Data structure / Algorithms
 - count the number of first character repeats
  - if the count is the same as the string size, return ""
 -  go through each character in the string
 -  each char
  - count number of repeats in the string
    - if count is euqal 1
      - return the character
  - return "" if the iteration passes


Pseudo Code

=end


def first_non_repeating_letter(string)
  for char in string.each_char
    return char if string.downcase.count(char.downcase) == 1
  end
  ''
end




p first_non_repeating_letter('a') == 'a'
p first_non_repeating_letter('sTreSS') == 'T'
p first_non_repeating_letter('moonmen') == 'e'
p first_non_repeating_letter('aabbcc') == ''
p first_non_repeating_letter('') == ''
p first_non_repeating_letter('aaa') == ''