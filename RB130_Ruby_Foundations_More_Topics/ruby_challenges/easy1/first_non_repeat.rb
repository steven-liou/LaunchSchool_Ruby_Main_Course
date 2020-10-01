# find the first non-repeat character of a string
# if there is no non-repeat, return -1

# create a hash for storing characters and their occurances
# iterate through each character in the string
# store the character and increment its value by 1
# find the first occurance of a character whose value is 1
# else return -1

def non_repeat(string)
  hash = Hash.new(0)

  string.chars.each { |char| hash[char] += 1 }
  hash.find { |_, occurance| occurance == 1 }
      &.first || -1
end


p non_repeat('steven') == 's'
p non_repeat('aabb') == -1
p non_repeat('hhelle') == -1
p non_repeat('hheelea') == 'l'