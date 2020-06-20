# remove the spaces and punctuations, and then downcase the English text

# the characters are borken into rows of lenght n

# the transformted letters are read by column, ignoring the missing letter on last row

# if the number of characters equal to a perfect square, use the root of that number. Else, use the root of the smallest square that is larger than the number of characters

class Crypto
  attr_reader :normalize_plaintext

  def initialize(string)
    @normalize_plaintext = normalize(string)
  end

  def ciphertext
    normalize_ciphertext('')
  end

  def normalize_ciphertext(delimiter=' ')
    segments = plaintext_segments
    columns = segments.first.length
    rows = segments.size

    sentences = columns.times.map do |column|
      sentence =rows.times.reduce('') do |cipher_sentence, row|
        cipher_sentence + (segments[row][column] || '')
      end
    end
    sentences.join(delimiter)
  end

  def plaintext_segments(text=normalize_plaintext)
    text.scan(/.{1,#{size}}/)
    # line_numbers = (text.length / size.to_f).ceil
    # sentence = []

    # line_numbers.times do |number|
    #   word = ''
    #   size.times do |line_index|
    #     index = line_index + size * number
    #     word += text[index] || break
    #   end
    #   sentence << word
    # end
    # sentence
  end

  def size
    Math.sqrt(@normalize_plaintext.length).ceil
  end

  private

  def normalize(string)
    string.gsub(/\W*/, '').downcase
  end



end

