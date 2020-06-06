=begin

Input : an array

Output : original array

Rules


Data structure / Algorithms
  allows both the current element and its associated index to be passed in as arguments when invoking the block
  return the original array
=end

def each_with_index(array)
  index = 0

  while index < array.size
    yield(array[index], index)
    index += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]