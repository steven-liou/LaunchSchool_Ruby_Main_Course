#take a string as an argument, return the string in reverse order

#< string
#> reverse the original string

# have an index that starts at 0, and have another index that starts at the end
# iterate from the ends to the center, swtich the characters at either index

def string_reverser(string)
  left_index = 0
  right_index = string.length - 1

  while left_index <= right_index
    string[left_index], string[right_index] = string[right_index], string[left_index]
    left_index += 1
    right_index -= 1
  end
end

hello = "Hello world"
string_reverser(hello)
puts hello