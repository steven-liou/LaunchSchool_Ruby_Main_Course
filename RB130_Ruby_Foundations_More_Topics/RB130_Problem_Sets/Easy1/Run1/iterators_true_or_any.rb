=begin

Input : an array

Output : boolean true/false if the supplied block value returns true at all

Rules


Data structure / Algorithms
  Iterate through each element of the array
    yield to the block, passing the element as an argument to the block
    make
    if the return value of the block is true, return true
  returns false if no block iteration returns true

=end

def any?(array)
  raise ArgumentError, 'No block given' unless block_given?
  is_true = false
  counter = 0

  while counter < array.size
    is_true = true if yield(array[counter])
    break if is_true
    counter += 1
  end

  is_true
end


p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
p any?([1, 2, 3])