# input : a string that contains letters and other characters
# output : percentage of characters that are lowercase, uppercase, and neither

# use count to check the number of uppercase letters, and lowercase letters,
# subtract the length of the uppercase letters and lowercase letters from the lenght of the string to get neither counts

def letter_percentages(string)
  uppercase_counts = string.count('[A-Z]')
  lowercase_counts = string.count('[a-z]')
  total = string.length
  neither_counts = total - uppercase_counts - lowercase_counts
  { lowercase: (lowercase_counts / total.to_f * 100).round(2),
    uppercase: (uppercase_counts / total.to_f * 100).round(2),
    neither: (neither_counts / total.to_f * 100).round(2)

  }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')