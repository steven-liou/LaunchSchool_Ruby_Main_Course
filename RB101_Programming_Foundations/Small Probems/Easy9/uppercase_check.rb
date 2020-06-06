# Input : string
# output : return true if all alphabetic characters in the string are true, else false. Ignore non-alphabetic chracters

def uppercase?(string)
  string.upcase == string 
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true