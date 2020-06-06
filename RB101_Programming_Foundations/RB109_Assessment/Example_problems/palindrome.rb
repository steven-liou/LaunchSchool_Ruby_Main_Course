# determine if a word is a palindrome without using the reverse method

# create a empty string that stores the given word in reverse order
# iterate through the original string in reverse order, and add each character to the empty string.
# compare the two strings to see if they are the same

def palindrome(string)

  reverse_string = ''

  index = -1

  loop do
    break if index < -string.length
    reverse_string << string[index]
    index -= 1
  end

  reverse_string == string

end

p palindrome('pop')
p palindrome('DooD')