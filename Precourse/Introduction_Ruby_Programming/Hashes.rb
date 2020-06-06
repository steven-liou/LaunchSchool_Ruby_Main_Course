#Problem 1
# family = { uncles: ["bob", "joe", "steve"],
#            sisters: ["jane", "jill", "beth"],
#            brothers: ["frank", "rob", "david"],
#            aunts: ["mary", "sally", "susan"]
#           }
# immediate_family = family.select {|key, val| key == :sisters || key == :brothers}

# p immediate_family
# p immediate_family.values
# p immediate_family.values.flatten

#Problem 2
# immediate_family = { sisters: ["jane", "jill", "beth"],
#            brothers: ["frank", "rob", "david"]
#           }
# extended_family = { uncles: ["bob", "joe", "steve"],
#                     aunts: ["mary", "sally", "susan"]
#                   }

# family = immediate_family.merge(extended_family)
# puts family
# puts immediate_family  #original hash is not mutated
# immediate_family.merge!(extended_family)
# puts immediate_family #original hash is mutated


#Problem 3
# immediate_family = { sisters: ["jane", "jill", "beth"],
#            brothers: ["frank", "rob", "david"]
#           }

# immediate_family.each_key {|key| puts key}

# immediate_family.each_value do |val|
#   puts val
# end

# immediate_family.each do |key, val|
#   puts "#{key}: #{val}"
# end


#Problem 4
# person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
# puts person[:name]

#Problem 5
# person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
# if person.has_value?("Bob")
#   puts "yes"
# else
#   puts "no"
# end

#Problem 6
# The new syntax style makes x as a symbol, so you need to access it as my_hash[:x]
# The former syntax will evaluate x into "hi there string", so you'd access this key by my_hash["hi there"]


#Problem 7
#You try to use a method called 'keys' that doesn't belong to Array type, Answer B

#Problem 8


# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
# hash = {}

# words.each do |word|
#   sorted_word = word.split('').sort.join
#   if hash.has_key?(sorted_word)
#     hash[sorted_word].push(word)
#   else
#     hash[sorted_word] = [word]
#   end
# end

# hash.each_value do |v|
#   puts "------"
#   p v
# end