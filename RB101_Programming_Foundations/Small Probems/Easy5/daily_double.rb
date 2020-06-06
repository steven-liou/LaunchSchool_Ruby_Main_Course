#input : string
#ouput : string with value of original string with consecutive duplicate characters collapsed into a single character

#create a new array that will store the characters
# split the input string into array, iterate through it
# each iteration, push the character to the new array, check if the last item in the new array already has this character
#join the new array

# def crunch(string)
#   clean_array = []

#   string.chars.each do |char|
#     clean_array << char if clean_array.last != char
#   end
#   clean_array.join
# end


def crunch(string)
  index = 0
  crunch_text = ''

  string.each_char do |char|
    crunch_text << char unless crunch_text[-1] == char
  end
  crunch_text
end


puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
