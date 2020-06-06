# Problem 1
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |value|
#   puts value
# end

#Problem 2
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |value|
#   if value > 5
#     puts value
#   end
# end

#Problem 3
# odds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select do |value|
#   value % 2 != 0
# end

# puts odds


#Problem 4
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# arr.unshift(0).push(11)
# puts arr
#Probem 5
# arr.pop
# arr << 3
# puts arr

#Problem 6
# arr = [1, 1,  2, 3, 4, 4, 5, 6, 7, 8, 9, 10]
# arr.uniq!
# puts arr

#Problem 7
# Array stores data in an ordered list, where as hash stores data as key/value pairs, which a user assess particular data in a hash as one would a variable/data in the normal sense

#Problem 8
# hash1 = {:key1 => 1,
#          :key2 => 2}
# hash2 = {key1: 1,
#          key2: 2}

#Problem 9
# h = {a:1, b:2, c:3, d:4}
# b = h[:b]
# puts b

# h[:e] = 5
# p h

# h.delete_if do |key, val|
#   val < 3.5
# end

# p h

# Problem 10
# Hash values can be arrays, so can has keys.
# {key1: [1, 2, 3]}
# You can have an array of hashes like so
# [{R1C1: 11, R1C2: 12},
#  {R2C1: 21, R2C2: 22}
# ]

#Problem 11
# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
# count = 0

# contacts.each do |key, val|
#   contacts[key] = {email: contact_data[count][0],
#                   address: contact_data[count][1],
#                   phone: contact_data[count][2]
#                   }
#   count += 1
# end
# p contacts

#Problem 13
# Joe's email can be accessed by
# contacts["Joe Smith"][:email]
# Sally;s phone number
# contacts["Sally Johnson"][:phone]


#Problem 13
# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

# arr.delete_if do |elem|
#   elem.start_with? "s"
# end
# puts arr

# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
# arr.delete_if {|elem| elem.start_with? "s", "w"}

# puts arr

#Problem 14

# a = ['white snow', 'winter wonderland', 'melting ice',
#      'slippery sidewalk', 'salted roads', 'white trees']

# one_word = a.map {|words| words.split(' ')}
# one_word = one_word.flatten
# p one_word

#Problem 15
# These hases are the same!

#Problem 16
# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
# fields = [:email, :address, :phone]

# contacts.each do |name, hash|
#   data = contact_data.shift
#   fields.each do |field|
#     contacts[name][field] = data.shift
#   end
# end

# puts contacts