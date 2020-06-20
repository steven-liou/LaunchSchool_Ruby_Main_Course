=begin

Input : a string

Output : given string that is in pig latin format

Rules
  if the word begins with "ay" sound (a, e, i o), add an "ay" at the end
  if the word begins with "u", "x", and "y", then add "ay" at the end unless they are followed by (a, e, i, o)
  else the word begins with a consanant sound, move the consant sound at the end

Data structure / Algorithms
    Array of chars

    Create a base_vowel_sound array
    create a special_vowel sound array

    iterate throught the array
      if the first character of the array is base vowel, then append "ay" do the end, break
      if the character is a special vowel, check if the next character is a base vowel,
        if it is, move the current character till the end
        else append "ay" to the end, break
      else move the current character to the end


=end

class PigLatin
  BASE_VOWELS = %w(a e i o)
  SPECIAL_VOWELS = %w(u x y)

  def self.translate(sentence)
    sentence.split.map { |word| convert_word(word) }.join(' ')
  end

  def self.convert_word(word)
    chars = word.chars

    loop do
      if BASE_VOWELS.include?(chars.first) || SPECIAL_VOWELS.include?(chars.first) && !BASE_VOWELS.include?(chars[1])
        chars << 'ay'
        break
      else
        chars << chars.shift
      end
    end
    chars.join('')
  end
end