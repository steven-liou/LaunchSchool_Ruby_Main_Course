# write a method that will return a substring based on specified indices
# can only use element reference/reassignment like string[0], no range string[0..3] or with a length string[0, 3]

# input : string
# output : substring of the given string with the given indices characters

# Appraoch :
#         If only one index is given, return the character on that index
#         If two index is given, return the characters starting from the first inedex to the last index, inclusive

# the second index should be greater than the first index

require 'pry'

def substring(string, index1, index2=nil)
  return string[index1] unless index2
  substring = ''

  for index in (index1..index2)
    break if index >= string.length
    substring << string[index]
  end

  substring
end

# p substring("honey", 0, 2) #== "hon"
# p substring("honey", 1, 2) #== "on"
# p substring("honey", 3, 9) #== "ey"
# p substring("honey", 2)    #== "n"


#write a method that finds all substrings in a string, No 1 letter words Use the previous method for this exercise

# create an empty array that holds the substrings
# outer iteration, increment starting index
# have a starting index that stays the same in each iteration, and increment it by 1 until it is equal to string length -1

# inner iteration, increment ending index
# have an ending index that starts 1 more than the starting index, and increment until it is string length - 1. For each iteration, push the substring from starting to ending index to the array


def substrings(string)
  substring_array = []
  starting_index = 0

  for starting_index in (0..(string.length - 2))
    for ending_index in ((starting_index + 1)..(string.length - 1))
      substring_array << substring(string, starting_index, ending_index)
    end
  end

  substring_array
end



# p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
# p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
# p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']


# write a method that will return all palindromes within a string

def palindromes(string)
  substrings = substrings(string)
  palindromes_array = []

  for substring in substrings
    palindromes_array << substring if substring == reverse(substring)
  end

  palindromes_array
end


def reverse(string)
  reverse_string = ''
  idx = string.size - 1

  while idx >= 0
    reverse_string << string[idx]
    idx -= 1
  end

  reverse_string
end

# p palindromes("ppop")

# write a method that finds the largest substring that is a palindrome within a string

def largest_palindrome(string)
  palindromes = palindromes(string)
  largets_idx = 0
  current_largest_size = palindromes[0].size

  for i in (1..palindromes.size - 1)
    largest_idx = i if palindromes[i].size > current_largest_size
  end

  palindromes[largest_idx]
end

p largest_palindrome("ppop")