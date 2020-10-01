# input : two integers. First is a count, second is the first number of a sequence
# output : an array of size 'count', sequence starts at the second argumment, sequence step is the second argument

# create an empty array of size count. Transform that array, by index * step

def sequence(size, start_step)
  number = 0
  Array.new(size).map do
    number += start_step
  end
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []