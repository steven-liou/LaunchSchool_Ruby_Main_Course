=begin

Input : an array and a block

Output : a new array with values at and after the first false element

Rules


Data structure / Algorithms
  create an empty array for storing results
  iterate through the input array with index
    yield to block, passing the current element as argument
      if the return value of the block is true, next
      else, concatenate all the elements at or after the current index to the result array, break
  return result array
=end

def drop_while(array)
  result = []

  array.each_with_index do |ele, index|
    next if yield(ele)
    result += array[index..-1]
    break
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []