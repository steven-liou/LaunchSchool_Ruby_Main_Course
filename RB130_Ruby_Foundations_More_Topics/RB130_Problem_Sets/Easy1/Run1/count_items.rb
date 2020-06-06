=begin

Input : an array, and a block that returns true or false

Output : the number a times the block returns true

Rules


Data structure / Algorithms
  create a counter that starts at 0
  iterate through each element of the given collection
    yield to the block, passing the current element as argument
    if the return value of the block is true, increment the counter by 1
  return the counter
=end

# def count(collection)
#   counter = 0

#   collection.each do |item|
#     counter += 1 if yield(item)
#   end

#   counter
# end

def count(collection, &block)
  if collection.empty?
    return 0
  else
    if block.call(collection.shift)
      1 + count(collection, &block)
    else
      0 + count(collection, &block)
    end
  end
end

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2