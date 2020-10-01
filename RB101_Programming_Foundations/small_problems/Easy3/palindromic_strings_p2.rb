#input: a string
  # checks if the string is a palindrome
    # case insensitive, ignore punctuations
# output: true or false

def real_palindrome?(string)
  string = string.downcase.gsub(/[^a-z0-9]/, '')
  # string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

def palindrome?(string)
  string == string.reverse
end


puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false