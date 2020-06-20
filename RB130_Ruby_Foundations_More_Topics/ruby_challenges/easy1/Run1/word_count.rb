=begin

Input : a sentence string

Output : a hash with key the word, and value the occurances of that word in original sentence

Rules
  word are alphaneumeric characters
  word is case insensitive
  word can be delimited by space or camma
  take care of exapnded list (\n characters etc)
  ignore punctuations
  take care of quotes
Data structure / Algorithms
    first, downcase the sentence, strip preceeding and trailing white spaces
    have a left_index and a right inddex that starts at 0
    have a bool for checking if left apostrophe is marked
    create a hash for storing words and their occruances

    iterate through each char of sentence with index
      if the char at left_index is ', and left_index == right_index, set bool to true
      if the current char is a ' ', or ','store the current word to hash


=end

class Phrase
  def initialize(sentence)
    @sentence = sentence.downcase
  end

  def word_count
    index = 0
    words = Hash.new(0)
    current_word = ''

    while index <= @sentence.length
      char = @sentence[index]
      if char == '\\'
        index += 2
        next
      elsif char =~ /[, ]/ || !char
        store_word(words, current_word) if current_word.match(/[\w]/)
        index += 1
        current_word = ''
        next
      end

      current_word << char if char =~ /[\w'"]/
      index += 1
    end
    words
  end

  def store_word(words, word)
    quote_word?(word) ? (words[word[1..-2]] += 1) : (words[word] += 1)
  end

  def quote_word?(word)
    word[0] == "'" && word[-1] == "'"
  end
end

