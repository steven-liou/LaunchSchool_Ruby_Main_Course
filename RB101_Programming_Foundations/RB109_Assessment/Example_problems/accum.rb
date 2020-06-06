# Given the string of chars a..z A..Z do as in the sample cases


# create an empty array that holds the substrings
# iterate through the given string
# have a index that stores the current position of the iteration
# for each character, multiples the character by the (index + 1)
# Capitalize the first letter of the resulting string,
# push the substring into the array, join by '-'



def accum(string)
  string_array = []

  for index in (0..string.length - 1)
    char = string[index]
    chars = char * (index + 1)
    string_array << chars.capitalize
  end

  string_array.join('-')
end


p accum("abcd")    # "A-Bb-Ccc-Dddd"
p accum("RqaEzty") # "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt")    # "C-Ww-Aaa-Tttt"