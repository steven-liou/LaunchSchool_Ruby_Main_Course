=begin

Input : array and a block

Output : largest value of the array element based on the return value of the block

Rules


Data structure / Algorithms
  Create a variable representing the index that contains the largest value based on the return value of the block
  create a variable that represents the current largest value,
  iterate through the array, with index
    if the largest value is nil, assign the return value to the largest value variable, next
    if the current block return value is greater than the largest value, update the current largest value, as well as the largest value index
  return the array's value at the largest value index
=end

def max_by(array)
  max_index = 0
  max = nil

  array.each_with_index do |value, index|
    value = yield(value)
    max, max_index = value, index if !max || max < value
  end
  array[max_index]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil