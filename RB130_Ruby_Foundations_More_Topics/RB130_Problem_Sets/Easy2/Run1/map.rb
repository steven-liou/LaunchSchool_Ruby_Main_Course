=begin

Input : an array and a block

Output : a new array with original array's elements transformed based on the return value of the block

Rules


Data structure / Algorithms
  create a new array of size equal to input array
  iterate through the input array by element, with index
    yield to the block, passing in the current element
    store the index of the array with the current return value of the block
  return the transformed array
=end

def map(array)
  result = Array.new(array.size)

  array.each_with_index { |ele, index| result[index] = yield(ele) }
  result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]