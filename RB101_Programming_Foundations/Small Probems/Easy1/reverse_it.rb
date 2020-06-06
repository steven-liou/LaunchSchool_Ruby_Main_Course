#Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(string)
  string.split.reverse.join(' ')
end


puts reverse_sentence('')  == ''
puts reverse_sentence('Hello World') 
puts reverse_sentence('Reverse these words')


#Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

def reverse_words(string)
  string_arr = string.split(' ')

  string_arr_reverse =  string_arr.map do |str|
                        str.length >= 5 ? str.reverse : str
                        end
  string_arr_reverse.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS