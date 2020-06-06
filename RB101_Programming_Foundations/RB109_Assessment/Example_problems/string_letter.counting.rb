# Take an input string and return a string that is made up of the number of occurances of each english letter in the input, followed by that letter. The string shouldn't contain zeros; leave them out.

# An empty string, or one with no letters, should return an empty string.

# Notes:
# the input will always be valid;
# treat letters as case-insensitive




# input : a string
# output : a new string with letter count format
# Rules : 
#  Only English alphabets are considered,
#  case insensitive
#  the output should be in alphabet order

# Algo:
  # create an empty hash (intended for key to be the alphabets, and values the occruances of the alphabet)
  # downcase the string to ignore the case
  # iterate through the string char by char
    # - check if the current char is an alphabet, if it is , add the current alphabet to the hash's value count by 1
  # convert the hash to array, and sort the subarray by hash key
  # create an empty string for the final result
  # then iterate through the array, and append the (vale, key) to the string
  # return the string

def string_letter_count(string)
  alphabets_hash = Hash.new(0)
  string.downcase!
  for char in string.each_char
    if ('a'..'z').include?(char)
      alphabets_hash[char] += 1
    end
  end
  alphabets = alphabets_hash.to_a
  alphabets.sort! { |arr1, arr2| arr1[0] <=> arr2[0] }
  
  result = ''

  for letter, count in alphabets.each
    result << count.to_s + letter
  end
  result
end




p string_letter_count("This is a test sentence.")  ==  "1a1c4e1h2i2n4s4t"
p string_letter_count("")                          ==  ""
p string_letter_count("555")                       ==  ""