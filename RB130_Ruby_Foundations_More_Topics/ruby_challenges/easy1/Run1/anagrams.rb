=begin

Input : a string and a list of possible anagrams

Output : anagrams of the given string

Rules
  an anagram contains the original letters in different orders

Data structure / Algorithms
  have a sorted string in another variable to compare the letters without order

  select from the anagram list
    for each possible anagram in the list
    first check if the current anagram is equal to the subject string, if it is, return nil
    sort the current anagram, compare if the current anagram is equal to the sorted subject. If it is, return true
    Else, return false
  Return the anagrams

=end

class Anagram
  def initialize(subject)
    @subject = subject
  end

  def match(anagrams_list)
    anagrams_list.select do |word|
      anagram?(word)
    end
  end

  # def anagram?(word)
  #   return false if @subject == word.downcase
  #   word.downcase.chars.sort == @subject.downcase.chars.sort
  # end

  def anagram?(word)
    return false if @subject.downcase == word.downcase
    word_to_hash(@subject) == word_to_hash(word)
  end

  def word_to_hash(word)
    word.chars.each_with_object({}) do |char, hash|
      char.downcase!
      hash[char] ||= 0
      hash[char] += 1
    end
  end
end

