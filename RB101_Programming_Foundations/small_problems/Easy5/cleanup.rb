
#input a string that contains non-alphabetic characters
#Output : a new string with the alphabetic characters from the original array,
#.  Replace non-alphabetic characters with spaces, if consecutive non-alphabetic characters, only replace with 1 space

#Check if the chracter is in the alkphabet
#if it is, append the character to an array,
#if it is not, append a ' ', check if consecutive ' '


ALPHABET = ('a'..'z').to_a

def cleanup(string)
  array = string.chars
  clean_chars = []

  array.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
  clean_chars.join

end


p cleanup("---what's my +*& line?")  == ' what s my line '
