#input two strings
# Determines the longest of the two strings
# concatenate short-long-short string
# return the string

def short_long_short(string1, string2)
  short_string = string1.size < string2.size ? string1 : string2
  long_string = string1.size > string2.size ? string1 : string2

  short_string + long_string + short_string
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"