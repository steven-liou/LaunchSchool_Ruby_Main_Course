# Create a method that will insert a space before the capital letter for words that are in camelCase

# input : a string
# output : a string with spaces between camelCase words

# iterate through the string, determine whether the current letter is capitalized
#   - if it is, check whether the previous character is alphabet, if it is, insert a space at current index, and increment the index by two
#   - if it is not, increment the index by 1

def break_camel(string)
  index = 0

  while index < string.length
    if ('A'..'Z').include?(string[index]) && string[index - 1] != ' '
      string.insert(index, ' ')
      index += 2
    else
      index += 1
    end
  end
  string
end










p break_camel("camelCasing") # == "camel Casing"
p break_camel('camelCasingTest')
p break_camel('government TimeBeTry')