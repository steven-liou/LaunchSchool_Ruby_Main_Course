=begin

Input : an array and a block

Output : nil

Rules
  Each iteration, take 2 consecutive elements and pass them to the block

Data structure / Algorithms
  iterate through the array with index, stopping at second to last index
    yield to the block with the current and next element
  return nil

=end

def each_cons(array)
  index = 0

  while index < array.size - 1
    yield(array[index], array[index + 1])
    index += 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil