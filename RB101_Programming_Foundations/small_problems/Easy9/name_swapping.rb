# split the string by space into an array
# reverse the array, join it back with a ', '

def swap_name(string)
  string.split.reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
