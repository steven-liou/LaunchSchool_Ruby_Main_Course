=begin

Input : a string

Output : a run-length encoding string of input string

Rules
  consecutive letters are represented by consecutive number count followed by the character
  AAABB is 3A2B

Data structure / Algorithms
  encode string
    an empty encoding string
    a count for current character consecutive number

    iterate each character of the string with index
      add 1 to the counter
      if the next character is the same as the current character, continue

      if counter == 1, then add the current character to the encoding string
      else, add the counter and the current character to the encoding string
      reset counter to 0

  decode string
    have a decoded empty string
    separate the number from the characters
    iterate through the array of number and characters
      if the current element is a number, next
      else check if the previous element is a number, if it is
        add that number of current character to the decoded string
        else, add the current character to the string
=end

class RunLengthEncoding
  def self.encode(string)
    encoded_string = ''
    consecutive_char_count = 0

    string.each_char.with_index do |char, index|
      consecutive_char_count += 1
      next if string[index + 1] == char && !(char =~ /\s/)

      consecutive_char_count == 1 ? encoded_string << char : encoded_string << (consecutive_char_count.to_s + char)
      consecutive_char_count = 0
    end
    encoded_string
  end

  # def self.decode(string)
  #   decoded_string = ''
  #   coded_elements = string.scan(/\d+|[^0-9]/)

  #   coded_elements.each_with_index do |ele, index|
  #     next if ele =~ /\d+/

  #     if coded_elements[index - 1] =~ /\d+/
  #       decoded_string << (ele * coded_elements[index - 1].to_i)
  #     else
  #       decoded_string << ele
  #     end
  #   end
  #   decoded_string
  # end

  def self.decode(string)
    decode_string = ''
    start_index = end_index = 0

    while end_index < string.length
      while ('0'..'9').cover?(string[end_index])
        end_index += 1
      end

      if start_index == end_index
        decode_string << string[end_index]
      else
        number = string[start_index...end_index].to_i
        decode_string << string[end_index] * number
      end
      end_index += 1
      start_index = end_index
    end
    decode_string
  end


end

p RunLengthEncoding.encode('AABBBCCCC')