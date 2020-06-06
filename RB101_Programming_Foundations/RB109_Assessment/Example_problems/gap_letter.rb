# You are given an array of English alphabets in normal alphabetic sequence. The given array would have at least 2 characters. However, there would be a missing letter in the sequence. Identify the missing letter in the array.


# compare the given alphabet array with normal alphabet array starting from the first letter
# iterate the given array, if a letter matches with the normal alphabet sequence, continue
# if a letter doesn't match the normal alphabet sequence, then get the normal alphabet letter

# check if the given array's letter is upper or lower case and change the letter to the correct case


def missing_letter(letters)
  alphabets = (letters.first..letters.last).to_a
  (alphabets - letters)[0]
end






p missing_letter(['a', 'b', 'd']) == 'c'
p missing_letter(['o', 'p', 'q', 's']) == 'r'
p missing_letter(['A', 'C']) == 'B'