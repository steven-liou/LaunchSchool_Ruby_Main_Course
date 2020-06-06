# input: a string
# output: an array that contains all possible substrings from the original string
# Approach : iterate through the original string by chracater,
#             for each chracter, get the increasing number of substrings until the end of the original string

def substrings(string)
  array = []
  string_length = string.size

  string_length.times do |idx|
    (string_length - idx).times do |last_index|
      array << string[idx..(idx + last_index)]
    end
  end

  array
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]