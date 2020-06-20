=begin

Input : a sentence string

Output : a new string with odd index words reversed

Rules
  - a word consists of letters
  - words are separated by 1+ spaces
  - a sentence is terminated by 0+ spaces and a point

  - output : words should only be separated by a space
             last word is terminated with a point
             odd index words are reversed, and even index words are echoed

Data structure / Algorithms
  have a string for storing words
  have a bool to indicate even/odd word
  have a start and an end index that start at 0

  iterate through the sentence by end index
    if the next character is a letter, increment end index by 1, continue

    if the next character is not a letter,
      word is from start_index to end_index
      reverse the word if it is odd,
      flip the bool
      append the result string with the word and a space
      set the start_index with current index + 2
      increment the end index by 1
  replace the last char of the string with a period
  return the result string

=end

def reverse_odd_words(sentence)
  result = ''
  odd_word = false
  start_index = 0
  end_index = 1

  while end_index <= sentence.length
    if sentence[end_index] =~ /[a-z]/i
      end_index += 1
      next
    end

    if sentence[start_index] =~ /[a-z]/i && (sentence[end_index- 1] =~ /[a-z]/i || end_index == sentence.length - 1)
      word = sentence[start_index..end_index - 1]
      word.reverse! if odd_word
      odd_word = !odd_word
      result << word + ' '
    end
    start_index = end_index + 1
    end_index += 1
  end
  result[-1] = '.' unless result.empty?
  result
end
p reverse_odd_words("") == ""
p reverse_odd_words("hello") == "hello."
p reverse_odd_words("hello.") == "hello."
p reverse_odd_words("whats     the matter with kansas    .") == "whats eht matter htiw kansas."
p reverse_odd_words("hello   world . ") == "hello dlrow."
