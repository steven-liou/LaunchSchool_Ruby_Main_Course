# The word i18n is a common abbreviation of internationalization in the developer community, used instead of typing the whole word and trying to spell it correctly. Similarly, a11y is an abbreviation of accessibility.

# Write a function that takes a string and turns any and all "words" (see below) within that string of length 4 or greater into an abbreviation, following these rules:

# A "word" is a sequence of alphabetical characters. By this definition, any other character like a space or hyphen (eg. "elephant-ride") will split up a series of letters into two words (eg. "elephant" and "ride").
# The abbreviated version of the word should have the first letter, then the number of removed characters, then the last letter (eg. "elephant ride" => "e6t r2e").
# Example
# abbreviate("elephant-rides are really fun!")
# //          ^^^^^^^^*^^^^^*^^^*^^^^^^*^^^*
# // words (^):   "elephant" "rides" "are" "really" "fun"
# //                123456     123     1     1234     1
# // ignore short words:               X              X

# // abbreviate:    "e6t"     "r3s"  "are"  "r4y"   "fun"
# // all non-word characters (*) remain in place
# //                     "-"      " "    " "     " "     "!"
# === "e6t-r3s are r4y fun!"



# ==========================================================

# # input : string
# # output : original string abbreviated by the given rules
#
# # Rules: abbreviate words >4 letter
# #        word is series of alphabets, word with hypens are split up
# #        abbrv. word has
# #                first character, number of removed characters, then last character
#
# # parse the string into words while keeping track of the delimiters of each word
# # for each word, check if its length is greater than 4, if it is, replace the middle characters with number of characters removed
#
#
# # have a string that stores the whole modified sentence
# # have a string that stores the current scanning word. If the current character in the string is an alphabet, add to that string,
# # else check if the storage string has length greater than 4, if it is
# #   add the word's first character, (length - 2), and last character to the modified     sentence,
# #.  add the non-alphabet character to the modified sentence
#
#
def abbreviate(string)
  modified_sentence = ''
  current_word = ''
   string.chars.each_with_index do |char, idx|
     if ('a'..'z').include?(char.downcase)
       current_word << char
       if idx == string.length - 1
         if current_word.length >= 4
           removed_length = current_word.length - 2
           modified_sentence << "#{current_word[0]}#{removed_length}#{current_word[-1]}"
         else
           modified_sentence << current_word
         end
       end
     else
       if current_word.length >= 4
         removed_length = current_word.length - 2
         modified_sentence << "#{current_word[0]}#{removed_length}#{current_word[-1]}#{char}"
       else
         modified_sentence << "#{current_word}#{char}"
       end

       current_word = ''
     end
   end
   modified_sentence
 end



p abbreviate("banana") == "b4a"
p abbreviate("double-barrel") == "d4e-b4l"
p abbreviate("You, and I need, and should speak.") == "You, and I n2d, and s4d s3k."