# ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

# Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".


=begin

Input : a string

Output : the ciphered string

Rules :
    if the character is an alphabet, then shift its position to 13 letters after it
Algorithm:
      - have an empty string the stores the ciphered string
      - iterate through each character in the string
        - check if the current character is an alphabet
          - if alphabet, check the case, shift its position to 13 letters after it
            - get the current letter's position, add 13 to it, then get its remainder of 26.
            -get the letter at the index, push it to the empty string
          - if not alphabet, add the character to the string directly
=end


def rot13(string)
  cipher_string = ''

  for char in string.each_char
    if char =~ /[a-z]/
      alphabets = ('a'..'z').to_a
      index = ( alphabets.index(char) + 13 ) % 26
      cipher_string << alphabets[index]
    elsif char =~ /[A-Z]/
      alphabets = ('A'..'Z').to_a
      index = ( alphabets.index(char) + 13 ) % 26
      cipher_string << alphabets[index]
    else
      cipher_string << char
    end
  end
  cipher_string
end


p rot13("test") # ==  "grfg"
p rot13("Test") #== "Grfg"
p rot13("te!st") # ==  "gr!fg"