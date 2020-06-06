# write a method that takes a single String argument and returns a new string that contains the original value of the argument, but the first letter of every word is now cpitalized.

# you may assume that words are any sequence of non-blank character, and that only the first character of each word must be considered

# the words that need to be capitalized are, at index 0, and after a space
# capitalize the first character in the string
# iterate through the string, check if the current character's previous character is a space


def word_cap(string)
  string[0] = string[0].upcase



  for idx in (1..string.length - 1)
    if string[idx - 1] == ' '
      string[idx] = string[idx].upcase
    end
  end

  string

end

a = 'four score and seven'
word_cap(a)

p a