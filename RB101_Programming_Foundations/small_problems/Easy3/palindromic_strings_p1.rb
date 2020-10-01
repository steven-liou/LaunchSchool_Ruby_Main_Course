#input: a string
  # checks if the string is a palindrome
    # case matters, so does punctuation
# output: true or false

def palindrome?(string)
  string == string.reverse
end


puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true


# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array

puts palindrome?(['abc', 'def', 'def', 'abc']) == true