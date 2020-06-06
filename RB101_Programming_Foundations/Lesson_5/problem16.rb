# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Write a method that returns one UUID when called with no parameters.


#create a lookup array to convert number to 'hex' string
#iterate each seciton of the ID
#for each section of the ID, randomly sample specified numbers from the hex table, to get string for that section
#store each section in an array, then join them by -


HEX_TABLE = []
(0..9).each do |num|
  HEX_TABLE.push(num.to_s)
end
('a'..'f').each do |str|
  HEX_TABLE.push(str)
end


def uuid
  num_char_array = [8, 4, 4, 4, 12]

  id = ''

  num_char_array.each_with_index do |num, idx|
    num.times do
      id += HEX_TABLE.sample
    end
    id += '-' unless idx == num_char_array.size - 1
  end
  id
end

puts uuid