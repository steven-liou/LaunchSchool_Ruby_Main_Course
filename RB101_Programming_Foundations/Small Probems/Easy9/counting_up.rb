# Given a integer
# return an array of integers, in sequence between 1 and the argument

def sequence(number)
  array = Array.new(number)

  number.times { |idx| array[idx] = idx + 1}
  array
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
