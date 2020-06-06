# Your task is to Reverse and Combine Words.


# Given a String containing different "words" separated by spaces

# 1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
#    (odd number of words => last one stays alone, but has to be reversed too)
# 2. Start it again until there's only one word without spaces
# 3. Return your result as string

# input: a string
# output : modified string

# Rules :
  # - if there is a space in the string, reverse all the words, then join them as pairs
  #   - if odd pairs, still reverse the last word
  # - repeat the same process until there is no more space in the string

# Algo:
# Split the words by space and into an array
# while array's length is greater than 1
#   Create an empty array that holds the results of this iteration
#   Iterate from first index to last index, with step of size 2
#     - FOr each iteration, check if the current element index is at the end, 
#     - if it is not, reverset the current element and also the next element, add it to the temp array
#     - if it is, then reverse current element, then add it to the temp array
#   - assign the temp array to the orginal array
#  - join the array into a string



p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi 123") == "defabc123ghi"
p reverse_and_combine_text("abc def gh34 434ff 55_eri 123 343") == "43hgff434cbafed343ire_55321"