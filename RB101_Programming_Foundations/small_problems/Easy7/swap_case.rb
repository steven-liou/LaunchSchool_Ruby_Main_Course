# input : a string
# output : a new string with original letter case sawpped

# split the string to array
# iterate through the array, if that char is lowercase, change it to uppercase, vice versa

# UPPERS = ('A'..'Z').to_a
# LOWERS = ('a'..'z').to_a

# def swapcase(string)
#   characters = string.chars.map do |char|
#     if UPPERS.include?(char)
#       char.downcase
#     elsif LOWERS.include?(char)
#       char.upcase
#     else
#       char
#     end
#   end
#   characters.join
# end
UPPER = /[A-Z]/
LOWER = /[a-z]/
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ UPPER
      char.downcase
    elsif char =~ LOWER
      char.upcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'