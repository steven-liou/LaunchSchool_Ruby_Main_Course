# What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

# 'abba' & 'baab' == true

# 'abba' & 'bbaa' == true

# 'abba' & 'abbba' == false

# 'abba' & 'abca' == false
# Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

=begin

Input : a word, and an array with words

Output : an array of all the anagrams or an empty array if none

Rules :

Algorithm:
    create a hash with key the alphabet and value the occurances for the input word
      - find the unique characters, into an array
      - iterate through the unique characters, for each character, get the counts in the word, set 'char':count to the hash
    iterate through the array of words (use select)
      - set a variable for boolean value
      - find the unique characters in the current word
        - iterate through the uniqe characters in the current word
        - if the count of current uniqe character in the current word is not the same as in the hash's key, then set anagram to false


=end

def anagrams(word, array)
  alphabets = {}

  for char in word.chars.uniq
    alphabets[char] = word.count(char)
  end

  for word in array.select
      anagram = true

      for char in word.chars.uniq
        if alphabets[char] != word.count(char)
          anagram = false
          break
        end
      end
      anagram
    end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']

p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']

p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []