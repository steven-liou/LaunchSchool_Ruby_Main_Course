# anagrams of a word are composed of the same characters, but in different order

# traverse a string by character
# find the index of the current character in the other string,
# if not found, then it is not an anagram
# if it is found, delete the character at that index from the other string
# when the other string is not empyt, then it is not an anagram,
# else it is an anagram

class Anagram
  def initialize(string)
    @anagram = string.downcase
  end

  def match(words)
    words.select do |word|
      anagram?(word.downcase)
    end
  end

  private
  def anagram?(string)
    return false if string == @anagram
    char_counts(@anagram) == char_counts(string)
  end

  def char_counts(string)
    string.each_char.with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
  end

end
