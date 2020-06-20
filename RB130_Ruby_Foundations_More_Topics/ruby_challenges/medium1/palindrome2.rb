=begin

Input : given a word

Output : whether the given word is a palindrome

Rules
  cannot use reverse
  cannot use regex
  ignore non letter characters
  solve it without traversing the string more than once

Data structure / Algorithms
  first create a character set of upper and lowercase letters

  have a left index that starts at 0, and a right index that starts at length n - 1
  first check if the character at left index is a letter, if it is not, increment left index by 1 next
  check  if the character at the right index is a letter, if it is not, decrement right index by 1, next

  if both are letters, check if they are the same
    returns false if they are not the same

  return true
=end

CHARS = ('a'..'z').to_a + ('A'..'Z').to_a

def palindrome?(string)
  left_index = 0
  right_index = string.length - 1

  while left_index < string.length
    if not_char?(string[left_index])
      left_index += 1
      next
    elsif not_char?(string[right_index])
      right_index -= 1
      next
    end

    return false if string[left_index] != string[right_index]

    left_index += 1
    right_index -= 1
  end
  true
end

def not_char?(char)
  !CHARS.include?(char)
end

p palindrome?("no1, 3on")
p palindrome?('redder')
p palindrome?('motor')
p palindrome?('')