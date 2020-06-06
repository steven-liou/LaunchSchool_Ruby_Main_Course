
a = (10..15).each
a.next

p a.peek
p a.next
#input a string that contains non-alphabetic characters
#Output : a new string with the alphabetic characters from the original array,
#.  Replace non-alphabetic characters with spaces, if consecutive non-alphabetic characters, only replace with 1 space

#Check if the chracter is in the alkphabet
#If not, then check the next characters until it is an alphabet. Replace those chracters with a space
require 'pry'

def cleanup(string)
    array = string.chars

    clean_array = []
    idx = 0

   loop do
      if ('a'..'z').include?(array[idx])
          clean_array << array[idx]
      else
      end
   end
   clean_array

end


p cleanup("---what's my +*& line?") # == ' what s my line '
