# words can be separated by a " ", ":", "\n", ","

class Phrase
  def initialize(string)
    @phrase = string
  end

  def word_count
    words = @phrase.split(/[\s,:.]+/)
    words.each_with_object(Hash.new(0)) do |word, hash|
      letters = normalize_word(word.downcase)
      hash[letters] += 1
    end
  end

  def normalize_word(word)
    letters_quotes = word.gsub(/[^\w']/, '')
    if letters_quotes[0] == "'" && letters_quotes[-1] == "'"
      letters_quotes[1...-1]
    elsif letters_quotes[0] == "'"
      letters_quotes[1..-1]
    else
      letters_quotes
    end
  end

end