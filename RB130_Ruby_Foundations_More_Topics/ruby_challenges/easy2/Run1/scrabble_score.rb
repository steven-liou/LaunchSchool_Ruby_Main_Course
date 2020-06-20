=begin

Input : a word

Output : scrabble score of the word

Rules
  Each letter has a corresponding scrabble value
  empty string or nil has 0 point
  string with non-alphabete word has 0 point
Data structure / Algorithms
  Use a hash to lookup the score of each letter in the word
  return the sum of the scores

=end

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 unless @word

    word = @word.upcase
    score_table = ('A'..'Z').each_with_object(Hash.new(0)) do |letter, table|
      case letter
      when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then table[letter] = 1
      when 'D', 'G'                                         then table[letter] = 2
      when 'B', 'C', 'M', 'P'                               then table[letter] = 3
      when 'F', 'H', 'V', 'W', 'Y'                          then table[letter] = 4
      when 'K'                                              then table[letter] = 5
      when 'J', 'X'                                         then table[letter] = 8
      when 'Q', 'Z'                                         then table[letter] = 10
      end
    end

    word.chars.reduce(0) { |score, letter| score + score_table[letter] }
  end

  def self.score(word)
    new(word).score
  end
end

