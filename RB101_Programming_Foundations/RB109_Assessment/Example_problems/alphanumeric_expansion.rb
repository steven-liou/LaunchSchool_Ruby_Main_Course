# Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string:
# The numeric values represent the occurrence of each letter preceding that numeric value.
# There should be no numeric characters in the final string. Empty strings should return an empty string.
# The first occurrence of a numeric value should be the number of times each character
# behind it is repeated, until the next numeric value appears.

# input : alphanumeric string

# output : 'expansion of the given string

# '' -> ''
# create a store array,
# iterate through the input string, once reach a alphabet character, look for the nearest preceeding number.

# find the numeric characters
# result = ''
#  - keep track of number (last_num = nil)
# iterate over the string
#   if the character is a letter
#      and last_num is nil, just append letter to result string


def string_expansion(string)
  result = ''
  num = nil

  string.split('').each do |char|
    if char =~ /[0-9]/
      num = char.to_i
    elsif num == nil && char =~ /[a-z]/i
      result << char
    elsif char =~ /[a-z]/i
      result << char * num
    end
  end
  result
end

def string_expansion(str)
  result = ''
  last_num = nil
  str.each_char do |char|
    if char.match?(/[a-z]/i)                          # if it's a letter
      result << char if last_num == nil               # append to result string if no number precedes
      result << (char * last_num) if last_num != nil  # multiply letter by preceding number then append
    else
      last_num = char.to_i
    end
  end
  result
end

def string_expansion(str)
  numbers = (1..9).to_a
  current_num = 1
  results = ''
  str.chars.each do |char|
    if numbers.include?(char.to_i)
      current_num = char.to_i
    else
      results << (char * current_num) # If it's a letter character without a preceding string, just multiplies by 1
    end
  end
  results
end



p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc')     == 'aaabbbccc'
p string_expansion('3d332f2a') == 'dddffaa'
p string_expansion('abcde')    == 'abcde'
p string_expansion('')         == ''
p string_expansion('3d1a5d2f') == 'dddadddddff'

