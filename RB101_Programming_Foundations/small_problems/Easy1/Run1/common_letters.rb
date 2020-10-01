# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.







# input : an array of strings of only lower case letters
# output : an array of all characters that are in all the strings in the original array, including duplicates

# iterate through the array of strings
# have an  array that stores the characters of the first word,
# iterate through the characters of the first word, if the count of a character is less than to the count of that character in the next word, keep it, else, remove it


def common_chars(words)
  commons = words[0].chars

  words.each do |word|
    commons.each do |char|
      if !word.include?(char)
        commons.delete(char)
      elsif commons.count(char) > word.count(char)
        index = commons.index(char)
        commons.delete_at(index)
      end
    end
  end

  commons
end





p common_chars(["bella","label","roller"]) == ["e", "l", "l"]
p common_chars(["coool","locoooook","cook"]) == ["c", "o", "o"]
p common_chars(["hello","goodbye","booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) == []