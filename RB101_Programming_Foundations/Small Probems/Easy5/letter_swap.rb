#input : a string of words separated by spaces
#output : a string with first and last letter of the input string swapped

# split each word of the string into an array
# for each word, swap the first and last character
# join the word array back to a join with spaces


def swap(string)
  words = string.split
  swap_words = words.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end

  swap_words.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'