#input : A string of words
#output: a hash that has keys the length of words, and values the occurances of that length

#split the word by space into an array
#create a hash that stores the items.  hash = {3 => 1}
# iterate the array
# find the length of the word, check if the hash has the key with that length
# if not key, then add a key with a value of 1
# if key, then add that key's value by 1


def word_sizes(string)
  hash = {}

  string.split.each do |word|
      length = word.length
      if hash[length]
          hash[length] +=  1
      else
          hash[length] = 1
      end
  end
  hash
end




p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}